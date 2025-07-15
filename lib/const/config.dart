import 'dart:ui';

class Config {
  // タイトル
  static const String appTitle = 'ヱビスビールに合う逸品グランプリ';

  // メニュー
  static const String menuLabelShop = '店舗情報';
  static const String menuLabelStamp = 'スタンプ';
  static const String menuLabelSetting = '設定';

  // マップ表示
  static const double defaultMapLatitude = 35.64691938518296;
  static const double defaultMapLongitude = 139.71008179999998;
  static const double defaultMapZoom = 17;
  static const int locationDistanceFilter = 50;
  static const int locationUpdateIntervalMs = 30000; // 30秒間隔
  static const String googleMapStyleJsonPath =
      'assets/jsons/google_map_style.json';
  static const String shopDefaultImagePath = 'assets/images/shop_default.png';
  static const String shopOpenImagePath = 'assets/images/shop_open.png';
  static const String shopSelectedImagePath = 'assets/images/shop_selected.png';
  static const String isStampedImagePath = 'assets/images/done.png';
  static const String isStampedSelectedImagePath =
      'assets/images/done_selected.png';
  static const double shopImageWidth = 50;
  static const double shopImageHeight = 50;
  static const double shopSelectedImageWidth = 80;
  static const double shopSelectedImageHeight = 80;
  static const double latitudeAdjustValue = 0.00002;
  static const double longitudeAdjustValue = 0.00002;
  static const String notInCurrentSalesText = '時間外';
  static const String irregularHoliday = '不定休';
  static const String needsReservation = '要予約';
  static const String allowLocationInformation = '位置情報を許可する';
  static const String inputKeyword = 'キーワードを入力';
  static const String fractionBar = '/';
  static const String shopsUnit = '件';
  static const String shopCardAttributeMenu = 'メニュー名';
  static const String shopCardAttributeAddress = '住所';
  static const String shopCardAttributeBusinessHours = '提供時間';
  static const int customMarkerIconGenerateProcessBatchSize = 100;

  // ボトムシート
  static const double bottomSheetMinSize = 0.05;
  static const double bottomSheetMaxSize = 0.785;
  static const double bottomSheetMinusValueFirst = 0.02;
  static const double bottomSheetMinusValueSecond = 0.05;
  static const int bottomSheetScreenHeightMinusThresholdFirst = 900;
  static const int bottomSheetScreenHeightMinusThresholdSecond = 800;
  static const String sortOrderLabel = '表示順: ';
  static const String noMatchingShops = '該当する店舗はありません';
  static const String showMap = '地図';
  static const String selectCard = '選択';

  // 現在地ボタン
  static const double currentPositionButtonWidth = 55;
  static const double currentPositionButtonHeight = 55;
  static const double currentPositionButtonPositionRight = 10;
  static const double currentPositionButtonPositionBottom = 20;

  // 地図表示ボタン
  static const double showMapButtonWidth = 100;
  static const double showMapButtonHeight = 55;
  static const double showMapButtonPositionRight = 10;
  static const double showMapButtonPositionBottom = 20;

  // ボタンのスペース
  static const int buttonMarginBottomWhenCardOpen = 200;
  static const int buttonMarginBottomNormal = 30;

  // 検索項目
  static const Map<int, String> searchItemList = {
    0: '営業中',
    1: 'スタンプ未獲得',
    2: '不定休',
    3: '完全予約制',
    4: 'ビアカクテル部門',
  };

  // 並び順
  static const Map<int, String> sortOrderList = {
    0: '店舗No.順',
    1: '現在地から近い順',
  };

  // 店舗詳細
  static const String openMap = '地図を開く';
  static const String hasStamp = '獲得済み (%d個)';
  static const String receiveStamp = 'スタンプを獲得';
  static const String cancelStamp = 'スタンプ取り消し';
  static const String mapSearchFirstKeyword = '恵比寿 %s %s';
  static const String googleMapsUrl = 'comgooglemaps://%s?q=%s';
  static const String appleMapsUrl = 'https://maps.apple.com/?q=%s';
  static const String browserUrl =
      'https://www.google.com/maps/search/?api=1&query=%s';

  // スタンプ
  static const String numberOfStampsObtained = 'スタンプ獲得数';
  static const String colon = '：';
  static const String stampUnit = '個';
  static const String isStampedLabel = '済';
  static const String stampNumLabelPerShop = '店舗別';
  static const String stampNumLabelTotal = '合計';

  // イベントページ
  static const String eventBaseUrl = 'https://ebisu-gp.com';

  // 設定
  static const String settingPageTitle = '設定画面';
  static const String themeLight = 'ライトモード';
  static const String themeDark = 'ダークモード';
  static const String themeSystemSetting = 'システム設定に従う';

  // メッセージ(成功系)
  static const String messageUrlCopied = 'URLをコピーしました';

  // メッセージ(促進系)
  static const String pleaseEnableLocationServices = '位置情報サービスを有効にしてください';

  // メッセージ(失敗系)
  static const String messageMapCannotOpened = 'マップを開けませんでした';
  static const String locationPermissionDenied = '位置情報の権限が拒否されました';
  static const String locationPermissionPermanentlyDenied =
      '位置情報の権限が永久に拒否されています';
  static const String failedToAnonymousLogin = '匿名ログインに失敗しました';
  static const String failedToLogout = 'ログアウトに失敗しました';
  static const String failedToGetAnonymousUserInformation =
      '匿名ユーザー情報の取得に失敗しました';
  static const String failedToGetLocationInformation = '位置情報の取得に失敗しました';
  static const String failedToGetShopInformation = '店舗情報の取得に失敗しました';
  static const String anErrorHasOccurred = 'エラーが発生しました';
  static const String error = 'Error';
  static const String errorDetail = '%s: %s';

  // ボタンのラベル
  static const String buttonLabelOk = 'OK';
  static const String buttonLabelClose = '閉じる';

  // カラーコード
  static final Color colorFromRGBOCancel =
      Color.fromRGBO(220, 150, 150, 0.9); // #dc9696;
  static final Color colorFromRGBODisabled =
      Color.fromRGBO(204, 204, 204, 0.9); // #cccccc
  static final Color colorFromRGBOBeerDark =
      Color.fromRGBO(161, 152, 34, 0.9); // #a19822
  static final Color colorFromRGBOBeer =
      Color.fromRGBO(255, 215, 64, 0.9); // #ffd740
  static final Color colorFromRGBOWhite =
      Color.fromRGBO(255, 255, 255, 0.9); // #ffffff

  // 文字サイズ
  static final double fontSizeVeryLarge = 36;
  static final double fontSizeLarge = 20;
  static final double fontSizeMediumLargeMiddle = 18;
  static final double fontSizeMediumLarge = 16;
  static final double fontSizeNormal = 14;
  static final double fontSizeSmall = 12;
  static final double fontSizeVerySmall = 10;

  // アイコンサイズ
  static final double iconSizeLarge = 24;
  static final double iconSizeMediumSmall = 18;
  static final double iconSizeSmall = 16;

  // 秒数
  static final int overlayRemoveDelayedTime = 3;
}
