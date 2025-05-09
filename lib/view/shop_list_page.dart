import 'dart:async';
import 'dart:collection';
import 'dart:core';
import 'dart:ui' as ui;

import 'package:egp_client/grpc_gen/egp.pb.dart';
import 'package:egp_client/provider/search_condition_provider.dart';
import 'package:egp_client/provider/search_keyword_provider.dart';
import 'package:egp_client/provider/sort_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/util.dart';
import '../const/config.dart';
import '../grpc_gen/egp.pb.dart' as pb;
import '../provider/marker_provider.dart';
import '../provider/shop_provider.dart';
import '../service/shop_service.dart';
import '../view/shop_detail_page.dart';
import '../icon/custom_icons.dart' as custom_icon;

class CustomMarker {
  final String id;
  final int no;
  final CategoryType categoryId;
  final LatLng position;
  final double zIndex;
  final bool inCurrentSales;
  final bool isStamped;
  final bool isIrregularHoliday;
  final bool needsReservation;
  final String imageUrl;
  BitmapDescriptor? icon;

  CustomMarker({
    required this.id,
    required this.no,
    required this.categoryId,
    required this.position,
    required this.zIndex,
    required this.inCurrentSales,
    required this.isStamped,
    required this.isIrregularHoliday,
    required this.needsReservation,
    required this.imageUrl,
    this.icon,
  });
}

class ShopListPage extends ConsumerStatefulWidget {
  const ShopListPage({super.key});

  @override
  ConsumerState<ShopListPage> createState() => _ShopListPageState();
}

class _ShopListPageState extends ConsumerState<ShopListPage> {
  bool _locationPermissionGranted = false;
  bool _mapCreated = false;
  late DraggableScrollableController _draggableController;
  late ScrollController _scrollController;
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  late StreamSubscription<Position>? _positionStream;
  late Map<String, Marker> _markers;
  late List<CustomMarker> _customMarkers;
  Position? currentPosition;
  final _markerQueue = Queue<CustomMarker>();
  bool _isUpdating = false;
  int shopsTotalNum = 0;

  final _pageController = PageController(
    viewportFraction: 0.85,
  );

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: Config.locationDistanceFilter,
  );

  // 初期位置
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(Config.defaultMapLatitude, Config.defaultMapLongitude),
    zoom: Config.defaultMapZoom,
  );

  // 店舗のデフォルトアイコン
  final shopDefaultIcon = AssetMapBitmap(
    Config.shopDefaultImagePath,
    width: Config.shopImageWidth,
    height: Config.shopImageHeight,
  );

  @override
  void initState() {
    super.initState();
    _startPositionStream();
    _markers = {};
    _customMarkers = [];
    _setShopsTotal();
    _initializeMarkers();
    _draggableController = DraggableScrollableController();
  }

  void _resetBottomSheet() {
    _draggableController.reset();
    _draggableController = DraggableScrollableController();
  }

  void _setShopsTotal() async {
    final shopsTotal = await ShopService.getShopsTotal(context);
    shopsTotalNum = shopsTotal!.totalNum.toInt();
  }

  void _initializeMarkers() async {
    final shops = await _searchShops();
    if (shops != null) {
      // 初期マーカーとしてデフォルトアイコンを表示
      _setCustomMarkers(shops);
      final tempMarkers = shops.shops.map(_createTempMarker).toList();
      _updateMarkers(tempMarkers);

      // カスタムマーカー生成
      _createCustomMarkers();
    }
  }

  Marker _createTempMarker(pb.Shop shop) {
    return Marker(
      markerId: MarkerId('${shop.id}'),
      position: LatLng(shop.latitude, shop.longitude),
      icon: shopDefaultIcon,
    );
  }

  void _processQueue([MarkerId? selectedMarkerId]) async {
    if (_isUpdating || _markerQueue.isEmpty) {
      return;
    }

    _isUpdating = true;
    final batchSize = _customMarkers.isNotEmpty
        ? _customMarkers.length
        : Config.customMarkerIconGenerateProcessBatchSize;
    final batch = _markerQueue.take(batchSize).toList();

    final newMarkers = await Future.wait(
      batch.map((customMarker) =>
          _createCustomMarker(customMarker, selectedMarkerId)),
    );

    _markerQueue.removeWhere((customMarker) => batch.contains(customMarker));
    _updateMarkers(newMarkers);
    _isUpdating = false;

    if (_markerQueue.isNotEmpty) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _processQueue(selectedMarkerId));
    }
  }

  void _createCustomMarkers([MarkerId? selectedMarkerId]) {
    // カスタムマーカー生成をキューに追加
    _markerQueue.addAll(_customMarkers);
    _processQueue(selectedMarkerId);
  }

  Future<Marker> _createCustomMarker(CustomMarker marker,
      [MarkerId? selectedMarkerId]) async {
    double zIndex = marker.inCurrentSales ? 2.0 : 1.0;
    if (selectedMarkerId != null && selectedMarkerId.value == marker.id) {
      zIndex = 3.0;
    } else if (marker.isStamped) {
      zIndex = 0.0;
    }
    final icon = await _generateCustomIcon(marker, selectedMarkerId);
    return Marker(
      markerId: MarkerId(marker.id),
      position: marker.position,
      icon: icon,
      zIndex: zIndex,
    );
  }

  void _updateMarkers(List<Marker> newMarkers) {
    setState(() {
      for (final marker in newMarkers) {
        final markerId = marker.markerId;
        // カスタムマーカーを設定
        _markers[markerId.toString()] = Marker(
          markerId: markerId,
          position: marker.position,
        ).copyWith(
          iconParam: marker.icon,
          zIndexParam: marker.zIndex,
          onTapParam: () {
            // ボトムシートの高さを初期状態に戻す
            _resetBottomSheet();
            ref.read(selectedMarkerProvider.notifier).selectMarker(markerId);
            _createCustomMarkers(markerId);
          },
        );
      }
    });
  }

  void _setCustomMarkers(ShopsResponse shops) async {
    resetCustomMarkers();
    for (var shop in shops.shops) {
      _customMarkers.add(
        CustomMarker(
          id: shop.id.toString(),
          no: shop.no,
          categoryId: shop.categoryId,
          position: LatLng(shop.latitude, shop.longitude),
          zIndex: 0.0,
          inCurrentSales: shop.inCurrentSales,
          isStamped: shop.isStamped,
          isIrregularHoliday: shop.isIrregularHoliday,
          needsReservation: shop.normalizedNeedsReservation,
          imageUrl: shop.menuImageUrl,
          icon: shopDefaultIcon,
        ),
      );
    }
  }

  Future<BitmapDescriptor> _generateCustomIcon(CustomMarker marker,
      [MarkerId? selectedMarkerId]) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    // 各種変数定義（デフォルトは営業時間外）
    double fontSize = 14;
    double size = 50;
    String iconPath = Config.shopOpenImagePath;
    String textLabel = Config.notInCurrentSalesText;
    Color textColor = Colors.white;
    int displayTextPositionCoefficient = 16; // テキスト表示位置調整用の係数
    var isStampedIconPath = Config.isStampedImagePath;
    // 店舗選択時の拡大表示
    if (selectedMarkerId != null && selectedMarkerId.value == marker.id) {
      size = 80;
      iconPath = Config.shopSelectedImagePath;
      isStampedIconPath = Config.isStampedSelectedImagePath;
      fontSize = 22;
      displayTextPositionCoefficient = 26;
      // 営業時間内
      if (marker.inCurrentSales) {
        textColor = Colors.black;
        // 要予約
        if (marker.needsReservation) {
          textLabel = Config.needsReservation;
        } else if (marker.isIrregularHoliday) {
          // 不定休
          textLabel = Config.irregularHoliday;
        }
      }
      // 営業時間内
    } else if (marker.inCurrentSales) {
      textColor = Colors.black;
      // 要予約
      if (marker.needsReservation) {
        textLabel = Config.needsReservation;
        // 不定休
      } else if (marker.isIrregularHoliday) {
        textLabel = Config.irregularHoliday;
      }
    }

    // 背景の円を描画
    final bgPaint = Paint()..color = Color(0xFFF3EEDA).withAlpha(200);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2, bgPaint);

    // アセットから画像を読み込み
    final ByteData data = await rootBundle.load(iconPath);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ui.Image image = fi.image;

    // 画像をそのまま描画
    canvas.drawImage(image,
        Offset((size - image.width) / 2, (size - image.height) / 2), Paint());

    // 背景の円を描画（暗くする用）
    if (marker.isStamped) {
      final bgPaint2 = Paint()
        ..color = Color(0xFFF3EEDA).withAlpha(200).withAlpha(255);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 2, bgPaint2);
    } else if (!marker.inCurrentSales) {
      final bgPaint3 = Paint()..color = Colors.black.withAlpha(150);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 2, bgPaint3);
    }

    // スタンプ獲得済み
    if (marker.isStamped) {
      final ByteData isStampedData = await rootBundle.load(isStampedIconPath);
      final Uint8List isStampedBytes = isStampedData.buffer.asUint8List();
      final ui.Codec isStampedCodec =
          await ui.instantiateImageCodec(isStampedBytes);
      final ui.FrameInfo isStampedFi = await isStampedCodec.getNextFrame();
      final ui.Image isStampedImage = isStampedFi.image;

      final imageSize = size;
      final imageOffset = Offset(0, 0);
      final imageRect =
          Rect.fromLTWH(imageOffset.dx, imageOffset.dy, imageSize, imageSize);
      canvas.drawImageRect(
          isStampedImage,
          Rect.fromLTWH(0, 0, isStampedImage.width.toDouble(),
              isStampedImage.height.toDouble()),
          imageRect,
          Paint());
    } else {
      // 店舗No.を描画
      final textPainterNo = TextPainter(
        text: TextSpan(
          text: marker.no.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: fontSize * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainterNo.layout();
      textPainterNo.paint(
        canvas,
        Offset(size / 2 - textPainterNo.width / 2,
            size / 8 - (textPainterNo.height) / 8),
      );

      // 通常営業以外の場合は情報を描画
      if (!marker.inCurrentSales ||
          marker.isIrregularHoliday ||
          marker.needsReservation) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: textLabel,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(size / 2 - textPainter.width / 2,
              size - textPainter.height - displayTextPositionCoefficient),
        );
      }
    }

    // 枠線にカテゴリの色を表示
    Color borderColor = Colors.black;
    switch (marker.categoryId) {
      case CategoryType.CATEGORY_TYPE_BEER_COCKTAIL:
        borderColor = Color(0xFF494967);
        break;
      case CategoryType.CATEGORY_TYPE_EBISU_1:
        borderColor = Color(0xFF7456D9);
        break;
      case CategoryType.CATEGORY_TYPE_EBISU_2:
        borderColor = Color(0xFF8BC0F0);
        break;
      case CategoryType.CATEGORY_TYPE_EBISU_SOUTH:
        borderColor = Color(0xFFD59B60);
        break;
      case CategoryType.CATEGORY_TYPE_EBISU_WEST:
        borderColor = Color(0xFFF0E157);
        break;
      case CategoryType.CATEGORY_TYPE_NONE:
        borderColor = Color(0xFF454545);
        break;
    }
    // 枠線を描画
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2 - 1.5, borderPaint);

    final img = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final data2 = await img.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(data2!.buffer.asUint8List());
  }

  void resetCustomMarkers() {
    setState(() {
      _markers = {};
      _customMarkers = [];
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    _draggableController.dispose();
    _pageController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  // 現在地ストリームを開始
  void _startPositionStream() async {
    final permissionGranted = await _checkLocationPermission();
    if (!permissionGranted) return;

    // 権限が許可された場合にGoogleMapを再ビルド
    if (permissionGranted) {
      setState(() {
        _locationPermissionGranted = true;
      });
      _positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen(
        (Position position) {
          // カメラを現在地に移動
          if (!_mapCreated) {
            CircularProgressIndicator();
          } else {
            _mapController.animateCamera(
              CameraUpdate.newLatLng(_kGooglePlex.target),
            );
          }
          setState(() {});
        },
        onError: (e) {
          print(Util.sprintf(
              Config.errorDetail, [Config.failedToGetLocationInformation, e]));
          Util.showAlertDialog(context, Config.failedToGetLocationInformation,
              Config.buttonLabelClose);
        },
      );
    }
  }

  // 現在地情報を取得
  Future<Position> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }

  // 店舗情報取得
  Future<ShopsResponse?> _searchShops() async {
    // 検索条件を取得
    final searchCondition =
        ref.read(searchConditionProvider.notifier).getSearchCondition();
    // 検索キーワードを取得
    final searchKeyword =
        ref.read(searchKeywordProvider.notifier).getSearchKeyword();
    // ソート順
    final sortOrder = ref.read(sortOrderProvider.notifier).getSortOrder();
    // 緯度・経度
    final position = await _getCurrentPosition();
    final latitude = position.latitude;
    final longitude = position.longitude;

    // 店舗情報を取得
    final shops = await ref.read(shopProvider(context).notifier).getShops(
        context,
        searchCondition,
        searchKeyword,
        sortOrder,
        latitude,
        longitude);
    if (shops != null) {
      // マーカー情報を更新
      Future.sync(() => _setCustomMarkers(shops));
      final selectedMarkerId =
          ref.read(selectedMarkerProvider.notifier).getSelectedMarker();
      _createCustomMarkers(selectedMarkerId);
    }
    // マーカーの選択状態を解除
    ref.read(selectedMarkerProvider.notifier).clearSelection();

    // ボトムシートのスクロール位置を先頭に戻す
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }

    return shops;
  }

  // キーワード検索
  void _keywordSearch() async {
    final query = _searchController.text.trim();
    // 検索キーワードを設定
    ref.read(searchKeywordProvider.notifier).setSearchKeyword(query);
    // 店舗情報を取得
    _searchShops();
  }

  @override
  Widget build(BuildContext context) {
    // マーカーリストを取得
    final selectedMarkerId = ref.watch(selectedMarkerProvider);
    // 選択中のマーカーID
    final shopListAsync = ref.watch(shopProvider(context));

    // 現在のテーマからカラースキームを取得
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Util.showAppCloseDialog(context, didPop, result);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // マップ表示
          shopListAsync.when(
            data: (shops) {
              if (_locationPermissionGranted) {
                return Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController controller) async {
                        final googleMapStyle = await rootBundle
                            .loadString(Config.googleMapStyleJsonPath);
                        if (Theme.of(context).brightness == Brightness.dark) {
                          await controller.setMapStyle(googleMapStyle);
                        }
                        _mapController = controller;
                        setState(() {
                          _mapCreated = true;
                        });
                      },
                      onTap: (LatLng position) async {
                        ref
                            .read(selectedMarkerProvider.notifier)
                            .clearSelection();
                        _createCustomMarkers();
                      },
                      markers: _markers.values.toSet(),
                    ),
                    if (!_mapCreated)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
              } else {
                return Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final permissionGranted =
                          await _checkLocationPermission();

                      // 権限が許可された場合にGoogleMapを再ビルド
                      if (permissionGranted) {
                        setState(() {
                          _locationPermissionGranted = true;
                        });
                      }
                    },
                    child: Text(Config.allowLocationInformation),
                  ),
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stackTrace) => Center(
              child:
                  Text(Util.sprintf(Config.errorDetail, [Config.error, error])),
            ),
          ),

          // 検索条件
          shopListAsync.when(
            data: (shops) {
              final searchCondition = ref.watch(searchConditionProvider);
              final searchKeyword = ref.watch(searchKeywordProvider);
              final searchItemList = ref
                  .read(searchConditionProvider.notifier)
                  .getSearchItemList();
              return Positioned(
                top: 8,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 8.0,
                            runSpacing: 0.0,
                            children: [
                              TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: colorScheme.surface,
                                  hintText: Config.inputKeyword,
                                  hintStyle: TextStyle(
                                      color: colorScheme.primary
                                          .withValues(alpha: 0.4)),
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: _keywordSearch,
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: (() {
                                        _searchController.clear();
                                        _keywordSearch();
                                      })),
                                ),
                                onSubmitted: (text) => _keywordSearch(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            spacing: 8.0,
                            runSpacing: 0.0,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 108,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 2.5),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surface,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: shops!.shops.length.toString(),
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: Config.fontSizeLarge,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ${Config.fractionBar} ',
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: Config.fontSizeNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: shopsTotalNum.toString(),
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: Config.fontSizeLarge,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ${Config.shopsUnit}',
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: Config.fontSizeNormal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8.0,
                      runSpacing: 0.0,
                      children: [
                        for (final MapEntry(:key, :value)
                            in searchItemList.entries) ...{
                          _buildSearchTypeButton(
                            context,
                            ref,
                            key,
                            value,
                            searchCondition,
                            searchKeyword,
                          ),
                        },
                      ],
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stackTrace) => Center(
              child:
                  Text(Util.sprintf(Config.errorDetail, [Config.error, error])),
            ),
          ),

          // カード表示
          shopListAsync.when(
            data: (shops) {
              if (_locationPermissionGranted) {
                // マーカー未選択の場合は非表示
                if (selectedMarkerId == null) {
                  return const SizedBox.shrink();
                }

                // 選択中のマーカーに該当するIndexを取得
                final selectedIndex = _markers.values
                    .toList()
                    .indexWhere((m) => m.markerId == selectedMarkerId);
                if (selectedIndex != -1) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // PageViewがビルドされた後にジャンプ
                    if (_pageController.hasClients) {
                      _pageController.jumpToPage(selectedIndex);
                    }
                  });
                }

                return Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  height: 160,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _markers.length,
                    onPageChanged: (index) async {
                      final markerId = _markers.values.toList()[index].markerId;
                      if (index != selectedIndex) {
                        // 選択状態のマーカーを更新
                        ref
                            .read(selectedMarkerProvider.notifier)
                            .selectMarker(markerId);
                        // 選択した店舗のマーカーを変更
                        _createCustomMarkers(markerId);
                      }
                      //スワイプ後のお店の座標までカメラを移動
                      final shop = shops!.shops[index];
                      _mapController.animateCamera(CameraUpdate.newLatLng(
                          LatLng(shop.latitude, shop.longitude)));
                    },
                    itemBuilder: (context, index) {
                      final shop = shops!.shops[index];
                      final attributes = {
                        Config.shopCardAttributeMenu: shop.menuName,
                        Config.shopCardAttributeAddress: shop.address,
                        Config.shopCardAttributeBusinessHours:
                            shop.businessHours,
                      };
                      return GestureDetector(
                          onTap: () async {
                            final result =
                                await Navigator.of(context).push<bool>(
                              MaterialPageRoute(builder: (context) {
                                final shop = shops.shops.elementAt(index);
                                return ShopDetailPage(
                                    year: shop.year,
                                    no: shop.no,
                                    shopId: shop.id.toInt(),
                                    shopName: shop.shopName,
                                    address: shop.address);
                              }),
                            ).then((onValue) async {
                              // 遷移先ページから戻ってきたあとの処理
                              // 店舗情報を取得
                              _searchShops();
                            });
                          },
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    '${shop.no}: ${shop.shopName}',
                                    style: TextStyle(
                                      fontSize: Config.fontSizeMiddleLarge,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 1,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 100,
                                          maxHeight: 100,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            shop.menuImageUrl,
                                            fit: BoxFit.contain,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Icon(Icons.error);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                              attributes.entries.map((entry) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4),
                                              child: Text(
                                                '${entry.key}: ${entry.value}',
                                                style: TextStyle(
                                                    fontSize: Config
                                                        .fontSizeVerySmall),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stackTrace) => Center(
              child:
                  Text(Util.sprintf(Config.errorDetail, [Config.error, error])),
            ),
          ),

          // 現在地ボタン
          _locationPermissionGranted
              ? Positioned(
                  right: Config.currentPositionButtonPositionRight,
                  bottom: Config.currentPositionButtonPositionBottom +
                      (selectedMarkerId != null
                          ? Config.buttonMarginBottomWhenCardOpen
                          : Config.buttonMarginBottomNormal),
                  child: _goToCurrentPositionButton(context),
                )
              : Container(),

          // ボトムシート
          shopListAsync.when(
            data: (shops) {
              if (_locationPermissionGranted) {
                final sortOrder = ref.watch(sortOrderProvider);
                final sortOrderList =
                    ref.read(sortOrderProvider.notifier).getSortOrderList();
                return DraggableScrollableSheet(
                  expand: false,
                  controller: _draggableController,
                  initialChildSize: Config.bottomSheetMinSize,
                  minChildSize: Config.bottomSheetMinSize,
                  maxChildSize: Config.bottomSheetMaxSize,
                  builder: (context, scrollController) {
                    _scrollController = scrollController;
                    return Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onVerticalDragUpdate: (details) {
                              final newSize = _draggableController.size -
                                  details.delta.dy /
                                      MediaQuery.of(context).size.height;
                              setState(() {
                                _draggableController.jumpTo(newSize.clamp(
                                    Config.bottomSheetMinSize,
                                    Config.bottomSheetMaxSize));
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary
                                        .withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: _draggableController.isAttached &&
                                    _draggableController.size >=
                                        Config.bottomSheetMinSize * 2.5
                                ? 60
                                : 0,
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _draggableController.isAttached &&
                                    _draggableController.size >=
                                        Config.bottomSheetMinSize * 2.5
                                ? DropdownButton<int>(
                                    isExpanded: true,
                                    value: sortOrder,
                                    items: sortOrderList.entries.map((entry) {
                                      return DropdownMenuItem<int>(
                                        value: entry.key,
                                        child: Text(entry.value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        // ソート順を設定
                                        ref
                                            .read(sortOrderProvider.notifier)
                                            .setSortOrder(value);
                                        // 店舗情報を取得
                                        _searchShops();
                                        // スクロール位置をリセット
                                        // scrollController.jumpTo(0);
                                      }
                                    },
                                  )
                                : null,
                          ),
                          shops!.shops.isNotEmpty
                              ? Expanded(
                                  child: ListView.separated(
                                      controller: _scrollController,
                                      itemCount: shops.shops.length,
                                      separatorBuilder: (context, index) =>
                                          const Divider(height: 1),
                                      itemBuilder: (context, index) {
                                        final shop =
                                            shops.shops.elementAt(index);
                                        final attributes = {
                                          Config.shopCardAttributeMenu:
                                              shop.menuName,
                                          Config.shopCardAttributeAddress:
                                              shop.address,
                                          Config.shopCardAttributeBusinessHours:
                                              shop.businessHours,
                                        };
                                        return GestureDetector(
                                          onTap: () async {
                                            final result =
                                                await Navigator.of(context)
                                                    .push<bool>(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                final shop = shops.shops
                                                    .elementAt(index);
                                                return ShopDetailPage(
                                                    year: shop.year,
                                                    no: shop.no,
                                                    shopId: shop.id.toInt(),
                                                    shopName: shop.shopName,
                                                    address: shop.address);
                                              }),
                                            ).then((onValue) async {
                                              // 遷移先ページから戻ってきたあとの処理
                                              // 店舗情報を取得
                                              _searchShops();
                                            });
                                          },
                                          child: Container(
                                            height: 180,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 20),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        shop.menuImageUrl,
                                                        fit: BoxFit.cover,
                                                        height: 140,
                                                        width: 160,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          }
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: loadingProgress
                                                                          .expectedTotalBytes !=
                                                                      null
                                                                  ? loadingProgress
                                                                          .cumulativeBytesLoaded /
                                                                      loadingProgress
                                                                          .expectedTotalBytes!
                                                                  : null,
                                                            ),
                                                          );
                                                        },
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return Icon(
                                                              Icons.error);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          Text(
                                                              '${shop.no}: ${shop.shopName}',
                                                              style: TextStyle(
                                                                  fontSize: Config
                                                                      .fontSizeMiddleLarge,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const SizedBox(
                                                              height: 4),
                                                        ] +
                                                        attributes.entries
                                                            .map((entry) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 4),
                                                            child: Text(
                                                              '${entry.key}: ${entry.value}',
                                                              style: TextStyle(
                                                                  fontSize: Config
                                                                      .fontSizeVerySmall),
                                                            ),
                                                          );
                                                        }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : Expanded(
                                  child: ListView(
                                    controller: _scrollController,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Text(
                                          Config.noMatchingShops,
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize:
                                                Config.fontSizeMiddleLarge,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stackTrace) => Center(
              child:
                  Text(Util.sprintf(Config.errorDetail, [Config.error, error])),
            ),
          ),

          // ボトムシート表示中に地図アイコンを表示
          _draggableController.isAttached &&
                  _draggableController.size > Config.bottomSheetMinSize * 7
              ? Positioned(
                  right: Config.showMapButtonPositionRight,
                  bottom: Config.showMapButtonPositionBottom +
                      Config.buttonMarginBottomNormal,
                  child: _showMapButton(context),
                )
              : Container(),
        ],
      ),
    );
  }

  // 検索条件更新Widget
  Widget _buildSearchTypeButton(BuildContext context, WidgetRef ref,
      int searchKey, String label, Set<int> selectedKeys, String keyword) {
    // 現在のテーマからカラースキームを取得
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: () async {
        // ボタンの選択状態を設定
        ref
            .read(searchConditionProvider.notifier)
            .setSearchCondition(searchKey);
        // 検索キーワードを設定
        ref.read(searchKeywordProvider.notifier).setSearchKeyword(keyword);
        // 店舗情報を取得
        _searchShops();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedKeys.contains(searchKey)
            ? Colors.amberAccent
            : colorScheme.surface,
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: Config.fontSizeSmall,
              color: selectedKeys.contains(searchKey)
                  ? Colors.black
                  : colorScheme.primary,
              fontWeight:
                  selectedKeys.contains(searchKey) ? FontWeight.bold : null)),
    );
  }

  // 現在値ボタンWidget
  Widget _goToCurrentPositionButton(BuildContext context) {
    // 現在のテーマからカラースキームを取得
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(Config.currentPositionButtonWidth,
            Config.currentPositionButtonHeight),
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.primary,
        shape: const CircleBorder(),
      ),
      onPressed: () async {
        final permissionGranted = await _checkLocationPermission();
        if (!permissionGranted) return;

        // 権限が許可された場合にGoogleMapを再ビルド
        if (permissionGranted) {
          setState(() {
            _locationPermissionGranted = true;
          });
        }

        // 現在のズームレベルを取得
        double zoomLevel = await _mapController.getZoomLevel();
        // 現在位置に移動
        final position = await _getCurrentPosition();
        final currentLatLng = LatLng(position.latitude, position.longitude);
        _mapController.animateCamera(
          CameraUpdate.newLatLngZoom(currentLatLng, zoomLevel),
        );
      },
      child: const Icon(Icons.my_location_outlined),
    );
  }

  // 地図表示ボタンWidget
  Widget _showMapButton(BuildContext context) {
    // 現在のテーマからカラースキームを取得
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(Config.showMapButtonWidth, Config.showMapButtonHeight),
        maximumSize:
            const Size(Config.showMapButtonWidth, Config.showMapButtonHeight),
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.primary,
      ),
      onPressed: () async {
        setState(() {
          _draggableController.reset();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            custom_icon.Custom.map,
            size: Config.iconSizeSmall,
            color: colorScheme.primary,
          ),
          Text(
            Config.showMap,
            style: TextStyle(
              fontSize: Config.fontSizeNormal,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  // 位置情報の権限を確認
  Future<bool> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 位置情報サービスが有効か確認
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Config.pleaseEnableLocationServices)),
      );
      return false;
    }

    // 位置情報の権限を確認
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(Config.locationPermissionDenied)),
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Config.locationPermissionPermanentlyDenied)),
      );
      return false;
    }

    return true;
  }
}
