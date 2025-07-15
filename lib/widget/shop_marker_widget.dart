import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../const/config.dart';
import '../service/marker_cache_service.dart';

class ShopMarkerWidget extends StatelessWidget {
  final String shopName;
  final bool inCurrentSales;
  final bool isStamped;
  final bool isIrregularHoliday;
  final bool needsReservation;

  const ShopMarkerWidget({
    super.key,
    required this.shopName,
    required this.inCurrentSales,
    this.isStamped = false,
    this.isIrregularHoliday = false,
    this.needsReservation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(
            _getMarkerImagePath(),
          ),
          height: 150,
          width: 150,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            shopName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // スタンプ済みの場合のオーバーレイ
        if (isStamped)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
      ],
    );
  }

  String _getMarkerImagePath() {
    if (isStamped) {
      return Config.shopSelectedImagePath; // スタンプ済みの場合
    } else if (!inCurrentSales) {
      return Config.shopDefaultImagePath; // 営業時間外の場合
    } else if (isIrregularHoliday) {
      return Config.shopDefaultImagePath; // 臨時休業の場合
    } else {
      return Config.shopSelectedImagePath; // 通常営業の場合
    }
  }
}

Future<BitmapDescriptor> createShopMarkerWidget({
  required String shopName,
  required bool inCurrentSales,
  bool isStamped = false,
  bool isIrregularHoliday = false,
  bool needsReservation = false,
}) async {
  final cacheService = MarkerCacheService();

  // キャッシュキーを生成
  final cacheKey = cacheService.generateMarkerKey(
    shopName: shopName,
    inCurrentSales: inCurrentSales,
    isStamped: isStamped,
    isIrregularHoliday: isIrregularHoliday,
    needsReservation: needsReservation,
  );

  // キャッシュから取得を試行
  final cachedBitmap = cacheService.getFromCache(cacheKey);
  if (cachedBitmap != null) {
    return cachedBitmap;
  }

  // キャッシュにない場合は新規作成
  final shopMarkerWidget = ShopMarkerWidget(
    shopName: shopName,
    inCurrentSales: inCurrentSales,
    isStamped: isStamped,
    isIrregularHoliday: isIrregularHoliday,
    needsReservation: needsReservation,
  );

  final result = await shopMarkerWidget.toBitmapDescriptor(
    logicalSize: const Size(100, 100),
    imageSize: const Size(200, 400),
  );

  // キャッシュに保存
  cacheService.saveToCache(cacheKey, result);

  return result;
}
