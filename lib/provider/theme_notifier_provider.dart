import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_notifier_provider.g.dart';

// Riverpodの状態管理プロバイダー
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static ThemeMode _cachedTheme = ThemeMode.system;
  static bool _isInitialized = false;

  @override
  Future<ThemeMode> build() async {
    if (_isInitialized) {
      return _cachedTheme;
    }

    // 非同期でSharedPreferencesから読み込み
    _loadThemeFromPrefs();

    // 初期値をすぐに返す
    return _cachedTheme;
  }

  Future<void> _loadThemeFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt('theme_mode') ?? ThemeMode.system.index;
      _cachedTheme = ThemeMode.values[savedIndex];
      _isInitialized = true;

      // 状態を更新（UIに反映）
      state = AsyncValue.data(_cachedTheme);
    } catch (e) {
      // エラーが発生した場合はデフォルトのテーマを使用
      _cachedTheme = ThemeMode.system;
      _isInitialized = true;
      state = AsyncValue.data(_cachedTheme);
    }
  }

  Future<void> updateTheme(ThemeMode mode) async {
    // キャッシュを即座に更新
    _cachedTheme = mode;
    state = AsyncValue.data(mode);

    // 非同期でSharedPreferencesに保存
    _saveThemeToPrefs(mode);
  }

  Future<void> _saveThemeToPrefs(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('theme_mode', mode.index);
    } catch (e) {
      // 保存に失敗した場合はログを出力するが、UIには影響しない
      debugPrint('Failed to save theme preference: $e');
    }
  }
}
