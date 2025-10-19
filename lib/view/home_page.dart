import 'dart:core';

import 'package:bcrd_client/view/setting_page.dart';
import 'package:bcrd_client/view/shop_list_page.dart';
import 'package:bcrd_client/view/stamp_management_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/config.dart';
import '../icon/custom_icons.dart' as custom_icon;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<dynamic> _items = [
    {
      'icon': Icons.list,
      'label': Config.menuLabelShop,
    },
    {
      'icon': custom_icon.Custom.stamp,
      'label': Config.menuLabelStamp,
    },
    {
      'icon': Icons.settings,
      'label': Config.menuLabelSetting,
    },
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    ShopListPage(),
    StampManagementPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: _widgetOptions.elementAt(_currentIndex)),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < _items.length; i++) ...{
                _buildTabItem(context, i, _items[i]['icon'], _items[i]['label'])
              }
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(
      BuildContext context, int index, IconData icon, String label) {
    final isSelected = index == _currentIndex;
    final colorScheme = Theme.of(context).colorScheme;
    // 画面幅とSafeAreaの左右パディングを取得
    final screenWidth = MediaQuery.of(context).size.width;
    final safePadding = MediaQuery.of(context).padding;
    // 利用可能な幅（左右のSafeAreaパディングを除外）
    final usableWidth = screenWidth - safePadding.left - safePadding.right;
    // 各ボタンの幅
    final buttonWidth = usableWidth / _items.length;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: buttonWidth,
        decoration: BoxDecoration(
          color: isSelected ? Config.colorFromRGBOBcrdBase : colorScheme.surface,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : colorScheme.primary,
              size: Config.iconSizeMediumSmall,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : colorScheme.primary,
                fontSize: Config.fontSizeSmall,
                fontWeight: isSelected ? FontWeight.bold : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
