import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../const/config.dart';

part 'sort_order_provider.g.dart';

// 店舗のソート順の状態を管理するプロバイダ
@riverpod
class SortOrder extends _$SortOrder {
  // 並び順項目定義
  final Map<int, String> sortOrderList = Config.sortOrderList;

  @override
  int build() {
    return 0;
  }

  Map<int, String> getSortOrderList() {
    return sortOrderList;
  }

  int getSortOrder() {
    return state;
  }

  int setSortOrder(int key) {
    state = key;
    return getSortOrder();
  }

  void resetSortOrder() {
    state = 0;
  }
}
