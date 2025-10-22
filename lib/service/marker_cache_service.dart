import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';

import '../const/config.dart';

class MarkerCacheService {
  static final MarkerCacheService _instance = MarkerCacheService._internal();

  factory MarkerCacheService() => _instance;

  MarkerCacheService._internal();

  final Map<String, BitmapDescriptor> _cache = {};
  final int _maxCacheSize = Config.markerMaxCacheSize; // 最大キャッシュサイズ
  final List<String> _accessOrder = []; // LRU用のアクセス順序管理

  /// キャッシュからマーカーアイコンを取得
  BitmapDescriptor? getFromCache(String key) {
    if (_cache.containsKey(key)) {
      // LRU: アクセス順序を更新
      _accessOrder.remove(key);
      _accessOrder.add(key);
      return _cache[key];
    }
    return null;
  }

  /// キャッシュにマーカーアイコンを保存
  void saveToCache(String key, BitmapDescriptor bitmap) {
    // 既存のキーの場合は削除して再追加
    if (_cache.containsKey(key)) {
      _accessOrder.remove(key);
    }

    _cache[key] = bitmap;
    _accessOrder.add(key);

    // キャッシュサイズ制限を超えた場合、最も古いアイテムを削除
    if (_cache.length > _maxCacheSize) {
      _evictOldestItem();
    }
  }

  /// 最も古いアイテムを削除（LRU）
  void _evictOldestItem() {
    if (_accessOrder.isNotEmpty) {
      final oldestKey = _accessOrder.removeAt(0);
      _cache.remove(oldestKey);
    }
  }

  /// マーカーキーを生成
  String generateMarkerKey({
    required String shopName,
    required bool inCurrentSales,
    required bool isStamped,
    required bool isIrregularHoliday,
    required bool needsReservation,
  }) {
    return '${shopName}_$inCurrentSales}_$isStamped}_$isIrregularHoliday}_$needsReservation';
  }

  /// キャッシュをクリア
  void clearCache() {
    _cache.clear();
    _accessOrder.clear();
  }

  /// キャッシュサイズを取得
  int getCacheSize() => _cache.length;

  /// キャッシュ統計情報を取得（デバッグ用）
  Map<String, dynamic> getCacheStats() {
    return {
      'cacheSize': _cache.length,
      'maxCacheSize': _maxCacheSize,
      'accessOrder': _accessOrder.length,
    };
  }

  /// デバッグ情報を出力
  void debugPrintStats() {
    if (kDebugMode) {
      final stats = getCacheStats();
      print('MarkerCache Stats: $stats');
    }
  }
}
