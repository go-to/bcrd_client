import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_keyword_provider.g.dart';

// キーワード検索の状態を管理するプロバイダ
@riverpod
class SearchKeyword extends _$SearchKeyword {
  @override
  String build() {
    return '';
  }

  String getSearchKeyword() {
    return state;
  }

  String setSearchKeyword(String keyword) {
    state = keyword;
    return getSearchKeyword();
  }

  void resetSearchKeyword() {
    state = '';
  }
}
