import 'package:bcrd_client/provider/theme_notifier_provider.dart';
import 'package:bcrd_client/view/auth_wrapper.dart';
import 'package:bcrd_client/view/shop_detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'const/config.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(themeNotifierProvider);

    // テーマの読み込み状態に関係なく、常にMaterialAppを返す
    final themeMode = themeAsync.when(
      data: (mode) => mode,
      loading: () => ThemeMode.system, // ローディング中はシステムテーマを使用
      error: (error, stack) => ThemeMode.system, // エラー時もシステムテーマを使用
    );

    return MaterialApp(
      title: Config.appTitle,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.black,
          surface: Color.fromRGBO(18, 18, 18, 1.0),
          onSurface: Colors.white,
        ),
      ),
      themeMode: themeMode,
      home: AuthWrapper(),
      routes: <String, WidgetBuilder>{
        '/shop_detail': (_) => ShopDetailPage(
              year: 0,
              no: 0,
              shopId: 0,
              shopName: '',
              address: '',
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
