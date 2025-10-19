//
//  Generated code. Do not modify.
//  source: bcrd.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SearchType extends $pb.ProtobufEnum {
  static const SearchType SEARCH_TYPE_IN_CURRENT_SALES = SearchType._(0, _omitEnumNames ? '' : 'SEARCH_TYPE_IN_CURRENT_SALES');
  static const SearchType SEARCH_TYPE_NOT_YET = SearchType._(1, _omitEnumNames ? '' : 'SEARCH_TYPE_NOT_YET');
  static const SearchType SEARCH_TYPE_IRREGULAR_HOLIDAY = SearchType._(2, _omitEnumNames ? '' : 'SEARCH_TYPE_IRREGULAR_HOLIDAY');

  static const $core.List<SearchType> values = <SearchType> [
    SEARCH_TYPE_IN_CURRENT_SALES,
    SEARCH_TYPE_NOT_YET,
    SEARCH_TYPE_IRREGULAR_HOLIDAY,
  ];

  static final $core.Map<$core.int, SearchType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SearchType? valueOf($core.int value) => _byValue[value];

  const SearchType._($core.int v, $core.String n) : super(v, n);
}

class SortOrderType extends $pb.ProtobufEnum {
  static const SortOrderType SORT_ORDER_NO = SortOrderType._(0, _omitEnumNames ? '' : 'SORT_ORDER_NO');
  static const SortOrderType SORT_ORDER_DISTANCE = SortOrderType._(1, _omitEnumNames ? '' : 'SORT_ORDER_DISTANCE');

  static const $core.List<SortOrderType> values = <SortOrderType> [
    SORT_ORDER_NO,
    SORT_ORDER_DISTANCE,
  ];

  static final $core.Map<$core.int, SortOrderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SortOrderType? valueOf($core.int value) => _byValue[value];

  const SortOrderType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
