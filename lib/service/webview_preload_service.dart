import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../const/config.dart';

class WebViewPreloadService {
  static final WebViewPreloadService _instance =
      WebViewPreloadService._internal();

  factory WebViewPreloadService() => _instance;

  WebViewPreloadService._internal();

  final Map<String, WebViewController> _preloadedControllers = {};
  final Map<String, DateTime> _cacheTimestamps = {};
  final List<String> _preloadQueue = [];
  bool _isPreloading = false;
  Timer? _cleanupTimer;

  static const int _maxCacheSize = 50; // 大量URLに対応してキャッシュサイズを増加
  static const Duration _cacheExpiration = Duration(hours: 6); // キャッシュ時間も延長
  static const String _cacheKeyPrefix = 'webview_cache_';

  Future<void> initialize() async {
    await _loadCacheTimestamps();
    _startCleanupTimer();
  }

  WebViewController? getPreloadedController(String url) {
    final cachedController = _preloadedControllers[url];
    if (cachedController != null) {
      final timestamp = _cacheTimestamps[url];
      if (timestamp != null &&
          DateTime.now().difference(timestamp) < _cacheExpiration) {
        return cachedController;
      } else {
        _removeFromCache(url);
      }
    }
    return null;
  }

  Future<WebViewController> createOptimizedController(String url) async {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..enableZoom(false)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          if (request.url.contains('ads')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ));

    await controller.loadRequest(
      Uri.parse(url),
      headers: {
        'Cache-Control': 'max-age=3600',
        'User-Agent': 'EbisuGP-Mobile-App/1.0',
        'Accept-Encoding': 'gzip, deflate, br',
      },
    );

    _preloadedControllers[url] = controller;
    _cacheTimestamps[url] = DateTime.now();
    await _saveCacheTimestamp(url);

    return controller;
  }

  Future<void> preloadUrls(List<String> urls,
      {bool priorityLoad = false}) async {
    if (_isPreloading && !priorityLoad) return;

    _isPreloading = true;

    // 既にキャッシュされていないURLのみを追加
    final newUrls =
        urls.where((url) => !_preloadedControllers.containsKey(url)).toList();

    if (priorityLoad) {
      // 優先処理の場合は先頭に挿入
      _preloadQueue.insertAll(0, newUrls);
    } else {
      // 通常処理の場合は末尾に追加
      _preloadQueue.addAll(newUrls);
    }

    await _processPreloadQueue();
    _isPreloading = false;
  }

  Future<void> preloadShopDetails(List<Map<String, dynamic>> shops) async {
    final urls = shops
        .map((shop) => '${Config.eventBaseUrl}/${shop['year']}/${shop['no']}')
        .toList();

    await preloadUrls(urls);
  }

  Future<void> _processPreloadQueue() async {
    const batchSize = 5; // バッチサイズを増加
    const maxConcurrentBatches = 2; // 同時実行バッチ数を制限

    final batches = <List<String>>[];
    while (_preloadQueue.isNotEmpty) {
      final batch = _preloadQueue.take(batchSize).toList();
      _preloadQueue.removeRange(0, batch.length.clamp(0, _preloadQueue.length));
      batches.add(batch);
    }

    // バッチを段階的に処理（リソース使用量を制御）
    for (int i = 0; i < batches.length; i += maxConcurrentBatches) {
      final concurrentBatches = batches.skip(i).take(maxConcurrentBatches);

      final batchFutures = concurrentBatches.map((batch) async {
        final futures = batch.map((url) => _preloadSingle(url));
        await Future.wait(futures);
      });

      await Future.wait(batchFutures);

      // バッチ間の待機時間を調整（大量処理対応）
      if (i + maxConcurrentBatches < batches.length) {
        await Future.delayed(Duration(milliseconds: 200));
      }
    }
  }

  Future<void> _preloadSingle(String url) async {
    if (_preloadedControllers.length >= _maxCacheSize) {
      _removeOldestFromCache();
    }

    await createOptimizedController(url);
  }

  void _removeFromCache(String url) {
    _preloadedControllers.remove(url);
    _cacheTimestamps.remove(url);
    _removeCacheTimestamp(url);
  }

  void _removeOldestFromCache() {
    if (_cacheTimestamps.isEmpty) return;

    final oldestEntry = _cacheTimestamps.entries.reduce(
      (a, b) => a.value.isBefore(b.value) ? a : b,
    );

    _removeFromCache(oldestEntry.key);
  }

  void _startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(Duration(minutes: 30), (_) {
      _cleanup();
    });
  }

  void _cleanup() {
    final now = DateTime.now();
    final expiredUrls = _cacheTimestamps.entries
        .where((entry) => now.difference(entry.value) > _cacheExpiration)
        .map((entry) => entry.key)
        .toList();

    for (final url in expiredUrls) {
      _removeFromCache(url);
    }
  }

  Future<void> _loadCacheTimestamps() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys =
          prefs.getKeys().where((key) => key.startsWith(_cacheKeyPrefix));

      for (final key in keys) {
        try {
          // 安全な型チェックとキャスト
          final value = prefs.get(key);
          int? timestamp;

          if (value is int) {
            timestamp = value;
          } else if (value is String) {
            timestamp = int.tryParse(value);
          }

          if (timestamp != null && timestamp > 0) {
            final url = key.substring(_cacheKeyPrefix.length);
            _cacheTimestamps[url] =
                DateTime.fromMillisecondsSinceEpoch(timestamp);
          }
        } catch (e) {
          // 個別キーの読み込み失敗は無視して続行
          continue;
        }
      }
    } catch (e) {
      // 全体的な読み込み失敗時は空の状態で続行
      _cacheTimestamps.clear();
    }
  }

  Future<void> _saveCacheTimestamp(String url) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_cacheKeyPrefix$url';
      await prefs.setInt(key, DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      // キャッシュタイムスタンプ保存失敗は無視
    }
  }

  Future<void> _removeCacheTimestamp(String url) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_cacheKeyPrefix$url';
      await prefs.remove(key);
    } catch (e) {
      // キャッシュタイムスタンプ削除失敗は無視
    }
  }

  void dispose() {
    _cleanupTimer?.cancel();
    _preloadedControllers.clear();
    _cacheTimestamps.clear();
    _preloadQueue.clear();
  }

  // 統計情報（デバッグ用）
  Map<String, dynamic> getStats() {
    return {
      'cacheSize': _preloadedControllers.length,
      'queueSize': _preloadQueue.length,
      'isPreloading': _isPreloading,
      'cachedUrls': _preloadedControllers.keys.toList(),
    };
  }
}
