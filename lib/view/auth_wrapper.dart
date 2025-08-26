import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/util.dart';
import '../const/config.dart';
import '../provider/firebase_provider.dart';
import '../service/auth_service.dart';
import '../service/grpc_service.dart';
import 'home_page.dart';

class AuthWrapper extends ConsumerStatefulWidget {
  const AuthWrapper({super.key});

  @override
  ConsumerState<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends ConsumerState<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          // ユーザーが未ログインの場合、匿名認証を実行
          ref.read(authServiceProvider.notifier).signInAnonymously();
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          // ログイン済みの場合、ホーム画面へ遷移
          return const HomePage();
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(
            child: Text(Util.sprintf(
                Config.errorDetail, [Config.anErrorHasOccurred, error]))),
      ),
    );
  }

  @override
  void dispose() {
    GrpcService.shutdown();
    super.dispose();
  }
}
