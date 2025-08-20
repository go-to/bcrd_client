import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../common/util.dart';
import '../const/config.dart';
import '../provider/firebase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  AuthService build() => AuthService();

  Future<void> signInAnonymously() async {
    try {
      final auth = ref.read(firebaseAuthProvider);
      await auth.signInAnonymously();
    } catch (e) {
      debugPrint(
          Util.sprintf(Config.errorDetail, [Config.failedToAnonymousLogin, e]));
    }
  }

  Future<void> signOut() async {
    try {
      final auth = ref.read(firebaseAuthProvider);
      await auth.signOut();
    } catch (e) {
      debugPrint(Util.sprintf(Config.errorDetail, [Config.failedToLogout, e]));
    }
  }

  // 現在のユーザーを取得
  User? getCurrentUser() {
    try {
      final auth = ref.read(firebaseAuthProvider);
      return auth.currentUser;
    } catch (e) {
      debugPrint(Util.sprintf(
          Config.errorDetail, [Config.failedToGetAnonymousUserInformation, e]));
    }
    return null;
  }
}
