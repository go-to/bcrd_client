import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/util.dart';
import '../const/config.dart';
import '../provider/theme_notifier_provider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeNotifierProvider).value;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Util.showAppCloseDialog(context, didPop, result);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text(Config.settingPageTitle)),
        body: Column(
          children: [
            _buildThemeOption(
                context, ref, Config.themeLight, ThemeMode.light, currentTheme),
            _buildThemeOption(
                context, ref, Config.themeDark, ThemeMode.dark, currentTheme),
            _buildThemeOption(context, ref, Config.themeSystemSetting,
                ThemeMode.system, currentTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(BuildContext context, WidgetRef ref, String title,
      ThemeMode value, ThemeMode? currentTheme) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          child: currentTheme == value
              ? Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : null,
        ),
      ),
      title: Text(title),
      onTap: () => ref.read(themeNotifierProvider.notifier).updateTheme(value),
    );
  }
}
