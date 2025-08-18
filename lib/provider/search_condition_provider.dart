import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../const/config.dart';

part 'search_condition_provider.g.dart';

// 検索条件の状態を管理するプロバイダ
@riverpod
class SearchCondition extends _$SearchCondition {
  // 検索項目名定義
  final Map<int, String> searchItemList = Config.searchItemList;

  @override
  Set<int> build() {
    return {};
  }

  Map<int, String> getSearchItemList() {
    return searchItemList;
  }

  List<int> getSearchCondition() {
    return state.toList();
  }

  List<int> setSearchCondition(int key) {
    if (state.contains(key)) {
      state = {...state}..removeWhere((value) => value == key);
    } else {
      state = {...state, key};
    }
    return getSearchCondition();
  }

  void resetSearchCondition() {
    state = {};
  }
}
