import 'dart:async';
import 'dart:io';
import 'package:egp_client/provider/stamp_provider.dart';
import 'package:egp_client/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const/config.dart';
import '../common/util.dart';
import '../icon/custom_icons.dart' as custom_icon;
import '../service/webview_preload_service.dart';

class ShopDetailPage extends ConsumerStatefulWidget {
  final int year;
  final int no;
  final int shopId;
  final String shopName;
  final String address;
  final WebViewController? preloadedController;

  const ShopDetailPage({
    super.key,
    required this.year,
    required this.no,
    required this.shopId,
    required this.shopName,
    required this.address,
    this.preloadedController,
  });

  @override
  ConsumerState<ShopDetailPage> createState() => _ShopPageDetail();
}

class _ShopPageDetail extends ConsumerState<ShopDetailPage> {
  bool isLoading = true;
  double loadingProgress = 0.0;
  String? errorMessage;
  late WebViewController _controller;
  Timer? _loadingTimeout;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    final String webViewUrl =
        '${Config.eventBaseUrl}/${widget.year}/${widget.no}';

    // プレウォーム済みコントローラーがあるかチェック
    final preloadedController =
    WebViewPreloadService().getPreloadedController(webViewUrl);

    // プレロードされたControllerがある場合はそれを使用、なければ新規作成
    if (preloadedController != null) {
      // プレロード済み - 即座に表示可能
      _controller = preloadedController;
      _setupNavigationDelegate(_controller);
      setState(() {
        isLoading = false;
        loadingProgress = 1.0;
      });
    } else {
      // 通常の初期化 - 新規読み込み
      _controller = WebViewController();
      _setupWebViewController(_controller);
      _loadWebView(webViewUrl);
    }
  }

  void _setupWebViewController(WebViewController controller) {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..enableZoom(false)
      ..setNavigationDelegate(_createNavigationDelegate())
      ..setUserAgent('EbisuGP-Mobile-App/1.0 (Android; Mobile)')
    // パフォーマンス最適化設定
      ..clearCache()
      ..clearLocalStorage();
  }

  void _setupNavigationDelegate(WebViewController controller) {
    controller.setNavigationDelegate(_createNavigationDelegate());
  }

  NavigationDelegate _createNavigationDelegate() {
    return NavigationDelegate(
      onNavigationRequest: (request) {
        if (request.url.contains('ads')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      onPageStarted: (url) {
        // 既存のタイムアウトをキャンセル
        _loadingTimeout?.cancel();

        // 30秒のタイムアウトを設定
        _loadingTimeout = Timer(const Duration(seconds: 30), () {
          if (mounted && isLoading) {
            setState(() {
              isLoading = false;
              errorMessage = 'ページの読み込みがタイムアウトしました。ネットワーク接続を確認してください。';
            });
          }
        });

        setState(() {
          isLoading = true;
          loadingProgress = 0.0;
          errorMessage = null;
        });
      },
      onProgress: (progress) {
        setState(() {
          loadingProgress = progress / 100.0;
        });
      },
      onPageFinished: (url) async {
        // タイムアウトをキャンセル
        _loadingTimeout?.cancel();

        // Google Maps APIの非同期読み込みに変更するJavaScriptを注入
        await _injectGoogleMapsAsyncScript();

        setState(() {
          isLoading = false;
          loadingProgress = 1.0;
        });
      },
      onWebResourceError: (error) {
        // タイムアウトをキャンセル
        _loadingTimeout?.cancel();

        setState(() {
          isLoading = false;
          errorMessage = 'ページの読み込みに失敗しました: ${error.description}';
        });
      },
    );
  }

  Future<void> _loadWebView(String url) async {
    // ネットワーク接続確認
    if (!await _checkNetworkConnection()) {
      setState(() {
        isLoading = false;
        errorMessage = 'ネットワーク接続を確認してください';
      });
      return;
    }

    try {
      await _controller.loadRequest(
        Uri.parse(url),
        headers: {
          'Cache-Control': 'max-age=3600', // 1時間キャッシュ
          'User-Agent': 'EbisuGP-Mobile-App/1.0',
        },
      );
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'ページの読み込みに失敗しました: $e';
      });
    }
  }

  Future<bool> _checkNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    // タイムアウトタイマーをキャンセル
    _loadingTimeout?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(authServiceProvider.notifier).getCurrentUser();
    final userId = user!.uid;
    final shopId = widget.shopId;
    final stampNumAsync = ref.watch(stampProvider(context, userId, shopId));
    // 現在のテーマからカラースキームを取得
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.no}: ${widget.shopName}'),
          automaticallyImplyLeading: false,
          // 戻るアイコン
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () async {
                // 現在のURLを取得してクリップボードにコピー
                String? currentUrl = await _controller.currentUrl();
                if (!mounted) return;
                if (currentUrl != null) {
                  Clipboard.setData(ClipboardData(text: currentUrl));
                  String message = '${Config.messageUrlCopied}\n$currentUrl';
                  if (mounted) {
                    // ignore: use_build_context_synchronously
                    _showTopSnackBar(context, message);
                  }
                }
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refreshWebView,
          child: Stack(
            children: [
              if (errorMessage == null) WebViewWidget(controller: _controller),
              if (errorMessage != null) _buildErrorView(),
              if (isLoading) _buildLoadingView(),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colorScheme.surface.withValues(alpha: 0.9),
                        minimumSize: Size(110, 60),
                        maximumSize: Size(110, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _launchMap();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            custom_icon.Custom.map,
                            size: Config.iconSizeLarge,
                            color: colorScheme.primary.withValues(alpha: 0.9),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Config.openMap,
                            style: TextStyle(
                              fontSize: Config.fontSizeSmall,
                              color: colorScheme.primary.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              stampNumAsync.when(
                data: (int stampNum) {
                  return Positioned(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // スタンプ獲得ボタン
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(stampProvider(context, userId, shopId)
                                    .notifier)
                                .addStamp(context, userId, shopId);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Config.colorFromRGBOBeer,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 18),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                custom_icon.Custom.stamp,
                                size: Config.iconSizeSmall,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                              Text(
                                stampNum > 0
                                    ? Util.sprintf(Config.hasStamp, [stampNum])
                                    : Config.receiveStamp,
                                style: TextStyle(
                                  fontSize: Config.fontSizeNormal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // スタンプ取り消しボタン
                        ElevatedButton(
                          onPressed: () {
                            if (stampNum == 0) {
                              return;
                            }
                            ref
                                .read(stampProvider(context, userId, shopId)
                                    .notifier)
                                .deleteStamp(context, userId, shopId);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                stampNum > 0 ? Colors.black : Colors.grey,
                            backgroundColor: stampNum > 0
                                ? Config.colorFromRGBOCancel
                                : Config.colorFromRGBODisabled,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 18),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                custom_icon.Custom.cancel,
                                size: Config.iconSizeSmall,
                                color:
                                    stampNum > 0 ? Colors.black : Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                Config.cancelStamp,
                                style: TextStyle(
                                  fontSize: Config.fontSizeNormal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (Object error, StackTrace stackTrace) => Center(
                  child: Text(
                      Util.sprintf(Config.errorDetail, [Config.error, error])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Container(
      color: Colors.white.withValues(alpha: 0.9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value: loadingProgress > 0 ? loadingProgress : null,
              strokeWidth: 3.0,
            ),
            SizedBox(height: 16),
            Text(
              '読み込み中... ${(loadingProgress * 100).toInt()}%',
              style: TextStyle(
                fontSize: Config.fontSizeNormal,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red[400],
              ),
              SizedBox(height: 16),
              Text(
                errorMessage ?? 'エラーが発生しました',
                style: TextStyle(
                  fontSize: Config.fontSizeNormal,
                  color: Colors.red[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _retryLoading,
                icon: Icon(Icons.refresh),
                label: Text('再読み込み'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _retryLoading() async {
    setState(() {
      isLoading = true;
      loadingProgress = 0.0;
      errorMessage = null;
    });

    // ネットワーク接続を再確認
    if (!await _checkNetworkConnection()) {
      setState(() {
        isLoading = false;
        errorMessage = 'ネットワーク接続を確認してください';
      });
      return;
    }

    final String webViewUrl =
        '${Config.eventBaseUrl}/${widget.year}/${widget.no}';

    // キャッシュをクリアして再読み込み
    await _controller.clearCache();
    await _controller.clearLocalStorage();

    _loadWebView(webViewUrl);
  }

  Future<void> _refreshWebView() async {
    // ネットワーク接続確認
    if (!await _checkNetworkConnection()) {
      if (mounted) {
        setState(() {
          errorMessage = 'ネットワーク接続を確認してください';
        });
      }
      return;
    }

    try {
      await _controller.reload();
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = 'ページの再読み込みに失敗しました';
        });
      }
    }
  }

  Future<void> _injectGoogleMapsAsyncScript() async {
    try {
      const String script = '''
        (function() {
          // 既存のGoogle Maps APIスクリプトタグを検索
          const scripts = document.querySelectorAll('script[src*="maps.googleapis.com"], script[src*="maps.google.com"]');
          
          scripts.forEach(function(script) {
            // 既にasync属性がある場合はスキップ
            if (script.hasAttribute('async') || script.hasAttribute('defer')) {
              return;
            }
            
            // 新しいスクリプトタグを作成（async付き）
            const newScript = document.createElement('script');
            newScript.src = script.src;
            newScript.async = true;
            
            // 元のスクリプトの属性をコピー
            Array.from(script.attributes).forEach(function(attr) {
              if (attr.name !== 'src') {
                newScript.setAttribute(attr.name, attr.value);
              }
            });
            
            // 元のスクリプトを新しいものに置き換え
            script.parentNode.replaceChild(newScript, script);
          });
          
          // 動的に読み込まれるGoogle Maps APIもinterceptして非同期化
          const originalAppendChild = Document.prototype.appendChild;
          const originalInsertBefore = Document.prototype.insertBefore;
          
          function interceptGoogleMapsScript(element) {
            if (element && element.tagName === 'SCRIPT' && 
                element.src && 
                (element.src.includes('maps.googleapis.com') || element.src.includes('maps.google.com')) &&
                !element.hasAttribute('async') && !element.hasAttribute('defer')) {
              element.async = true;
            }
            return element;
          }
          
          Document.prototype.appendChild = function(element) {
            return originalAppendChild.call(this, interceptGoogleMapsScript(element));
          };
          
          Document.prototype.insertBefore = function(element, referenceNode) {
            return originalInsertBefore.call(this, interceptGoogleMapsScript(element), referenceNode);
          };
        })();
      ''';

      await _controller.runJavaScript(script);
    } catch (e) {
      debugPrint('Google Maps async script injection failed: \$e');
    }
  }

  void _showTopSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Material(
          elevation: 4.0,
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(2.0),
            color: Config.colorFromRGBOBeerDark,
            child: SafeArea(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Config.fontSizeMediumLarge,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );

    // Overlayに追加
    overlay.insert(overlayEntry);

    // 数秒後に削除
    Future.delayed(Duration(seconds: Config.overlayRemoveDelayedTime), () {
      overlayEntry.remove();
    });
  }

  Future<void> _launchMap() async {
    String searchQuery = Uri.encodeFull(Util.sprintf(
        Config.mapSearchFirstKeyword,
        [widget.shopName, widget.address.replaceAll('&', ' ')]));
    final googleMapsUrl =
        Uri.parse(Util.sprintf(Config.googleMapsUrl, [searchQuery]));
    final appleMapsUrl =
        Uri.parse(Util.sprintf(Config.appleMapsUrl, [searchQuery]));
    final browserUrl =
        Uri.parse(Util.sprintf(Config.browserUrl, [searchQuery]));

    // Google Mapsアプリがインストールされているか確認
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    }
    // iPhoneのデフォルトマップアプリ（Apple Maps）を起動
    else if (await canLaunchUrl(appleMapsUrl)) {
      await launchUrl(appleMapsUrl);
    }
    // ブラウザでGoogle Mapsを開く
    else if (await canLaunchUrl(browserUrl)) {
      await launchUrl(browserUrl);
    } else if (mounted) {
      // どれも起動できない場合のエラーメッセージ
      Util.showAlertDialog(
          context, Config.messageMapCannotOpened, Config.buttonLabelClose);
    }
  }
}
