import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WebViewCacheManager {
  static final WebViewCacheManager _instance = WebViewCacheManager._internal();

  factory WebViewCacheManager() => _instance;

  WebViewCacheManager._internal();

  static const String _cachePrefix = 'webview_cache_';
  static const String _metadataPrefix = 'webview_meta_';
  static const int _maxCacheSize = 50 * 1024 * 1024; // 50MB
  static const Duration _defaultCacheExpiry = Duration(hours: 24);

  final Map<String, dynamic> _memoryCache = {};
  SharedPreferences? _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await _cleanExpiredCache();
  }

  Future<void> cacheWebViewData(
    String url,
    Map<String, dynamic> data, {
    Duration? expiry,
  }) async {
    final cacheKey = _getCacheKey(url);
    final metaKey = _getMetaKey(url);

    final metadata = {
      'url': url,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'expiry': (expiry ?? _defaultCacheExpiry).inMilliseconds,
      'size': _calculateDataSize(data),
    };

    // メモリキャッシュに保存
    _memoryCache[cacheKey] = {
      'data': data,
      'metadata': metadata,
    };

    // 永続化
    await _prefs?.setString(cacheKey, jsonEncode(data));
    await _prefs?.setString(metaKey, jsonEncode(metadata));

    await _enforceMaxCacheSize();
  }

  Future<Map<String, dynamic>?> getCachedWebViewData(String url) async {
    final cacheKey = _getCacheKey(url);

    // メモリキャッシュから取得を試行
    final memoryCached = _memoryCache[cacheKey];
    if (memoryCached != null) {
      final metadata = memoryCached['metadata'] as Map<String, dynamic>;
      if (_isValidCache(metadata)) {
        return memoryCached['data'] as Map<String, dynamic>;
      } else {
        _memoryCache.remove(cacheKey);
      }
    }

    // 永続化キャッシュから取得を試行
    final metaKey = _getMetaKey(url);
    final metadataStr = _prefs?.getString(metaKey);
    if (metadataStr == null) return null;

    final metadata = jsonDecode(metadataStr) as Map<String, dynamic>;
    if (!_isValidCache(metadata)) {
      await _removeFromCache(url);
      return null;
    }

    final cachedDataStr = _prefs?.getString(cacheKey);
    if (cachedDataStr == null) return null;

    final cachedData = jsonDecode(cachedDataStr) as Map<String, dynamic>;

    // メモリキャッシュに復元
    _memoryCache[cacheKey] = {
      'data': cachedData,
      'metadata': metadata,
    };

    return cachedData;
  }

  Future<void> preloadCommonUrls(List<String> urls) async {
    const batchSize = 10; // 大量URL用にバッチサイズを増加
    const maxConcurrentBatches = 3; // 並列バッチ数を増加

    // URLをバッチに分割
    final batches = <List<String>>[];
    for (int i = 0; i < urls.length; i += batchSize) {
      batches.add(urls.skip(i).take(batchSize).toList());
    }

    // バッチを段階的に処理
    for (int i = 0; i < batches.length; i += maxConcurrentBatches) {
      final concurrentBatches = batches.skip(i).take(maxConcurrentBatches);

      final batchFutures = concurrentBatches.map((batch) async {
        final futures = batch.map(_preloadUrl);
        await Future.wait(futures);
      });

      await Future.wait(batchFutures);

      // バッチ間の待機時間を短縮
      if (i + maxConcurrentBatches < batches.length) {
        await Future.delayed(Duration(milliseconds: 50));
      }
    }
  }

  Future<void> _preloadUrl(String url) async {
    // 既にキャッシュされているかチェック
    final cached = await getCachedWebViewData(url);
    if (cached != null) return;

    // プリロード用のデータ（実際の実装ではHTTPリクエストなど）
    final data = {
      'url': url,
      'preloaded': true,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    await cacheWebViewData(url, data);
  }

  String _getCacheKey(String url) => '$_cachePrefix${_hashUrl(url)}';

  String _getMetaKey(String url) => '$_metadataPrefix${_hashUrl(url)}';

  String _hashUrl(String url) {
    return url.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
  }

  bool _isValidCache(Map<String, dynamic> metadata) {
    final timestamp = metadata['timestamp'] as int?;
    final expiry = metadata['expiry'] as int?;

    if (timestamp == null || expiry == null) return false;

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final expiryDuration = Duration(milliseconds: expiry);

    return DateTime.now().difference(cacheTime) < expiryDuration;
  }

  int _calculateDataSize(Map<String, dynamic> data) {
    try {
      return utf8.encode(jsonEncode(data)).length;
    } catch (e) {
      return 1024; // デフォルトサイズ
    }
  }

  Future<void> _enforceMaxCacheSize() async {
    int totalSize = 0;
    final cacheItems = <MapEntry<String, int>>[];

    for (final entry in _memoryCache.entries) {
      final metadata = entry.value['metadata'] as Map<String, dynamic>;
      final size = metadata['size'] as int? ?? 1024;
      totalSize += size;
      cacheItems.add(MapEntry(entry.key, metadata['timestamp'] as int));
    }

    if (totalSize <= _maxCacheSize) return;

    // 古いアイテムから削除
    cacheItems.sort((a, b) => a.value.compareTo(b.value));

    for (final item in cacheItems) {
      final metadata =
          _memoryCache[item.key]?['metadata'] as Map<String, dynamic>?;
      if (metadata == null) continue;

      final url = metadata['url'] as String;
      await _removeFromCache(url);

      totalSize -= (metadata['size'] as int? ?? 1024);
      if (totalSize <= _maxCacheSize * 0.8) break; // 20%のバッファを残す
    }
  }

  Future<void> _removeFromCache(String url) async {
    final cacheKey = _getCacheKey(url);
    final metaKey = _getMetaKey(url);

    _memoryCache.remove(cacheKey);
    await _prefs?.remove(cacheKey);
    await _prefs?.remove(metaKey);
  }

  Future<void> _cleanExpiredCache() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    final metaKeys = keys.where((key) => key.startsWith(_metadataPrefix));

    for (final metaKey in metaKeys) {
      final metadataStr = _prefs?.getString(metaKey);
      if (metadataStr == null) continue;

      final metadata = jsonDecode(metadataStr) as Map<String, dynamic>;
      if (!_isValidCache(metadata)) {
        final url = metadata['url'] as String;
        await _removeFromCache(url);
      }
    }
  }

  Future<void> clearCache() async {
    _memoryCache.clear();

    final keys = _prefs?.getKeys() ?? <String>{};
    final cacheKeys = keys.where((key) =>
        key.startsWith(_cachePrefix) || key.startsWith(_metadataPrefix));

    for (final key in cacheKeys) {
      await _prefs?.remove(key);
    }
  }

  Map<String, dynamic> getCacheStats() {
    int totalSize = 0;
    int itemCount = _memoryCache.length;

    for (final entry in _memoryCache.values) {
      final metadata = entry['metadata'] as Map<String, dynamic>;
      totalSize += (metadata['size'] as int? ?? 1024);
    }

    return {
      'itemCount': itemCount,
      'totalSize': totalSize,
      'maxSize': _maxCacheSize,
      'utilization': totalSize / _maxCacheSize,
    };
  }
}
