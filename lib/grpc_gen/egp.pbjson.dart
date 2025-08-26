//
//  Generated code. Do not modify.
//  source: egp.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use categoryTypeDescriptor instead')
const CategoryType$json = {
  '1': 'CategoryType',
  '2': [
    {'1': 'CATEGORY_TYPE_NONE', '2': 0},
    {'1': 'CATEGORY_TYPE_EBISU_1', '2': 1},
    {'1': 'CATEGORY_TYPE_EBISU_2', '2': 2},
    {'1': 'CATEGORY_TYPE_EBISU_WEST', '2': 3},
    {'1': 'CATEGORY_TYPE_EBISU_SOUTH', '2': 4},
    {'1': 'CATEGORY_TYPE_BEER_COCKTAIL', '2': 5},
  ],
};

/// Descriptor for `CategoryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryTypeDescriptor = $convert.base64Decode(
    'CgxDYXRlZ29yeVR5cGUSFgoSQ0FURUdPUllfVFlQRV9OT05FEAASGQoVQ0FURUdPUllfVFlQRV'
    '9FQklTVV8xEAESGQoVQ0FURUdPUllfVFlQRV9FQklTVV8yEAISHAoYQ0FURUdPUllfVFlQRV9F'
    'QklTVV9XRVNUEAMSHQoZQ0FURUdPUllfVFlQRV9FQklTVV9TT1VUSBAEEh8KG0NBVEVHT1JZX1'
    'RZUEVfQkVFUl9DT0NLVEFJTBAF');

@$core.Deprecated('Use searchTypeDescriptor instead')
const SearchType$json = {
  '1': 'SearchType',
  '2': [
    {'1': 'SEARCH_TYPE_IN_CURRENT_SALES', '2': 0},
    {'1': 'SEARCH_TYPE_NOT_YET', '2': 1},
    {'1': 'SEARCH_TYPE_IRREGULAR_HOLIDAY', '2': 2},
    {'1': 'SEARCH_TYPE_NEEDS_RESERVATION', '2': 3},
    {'1': 'SEARCH_TYPE_BEER_COCKTAIL', '2': 4},
  ],
};

/// Descriptor for `SearchType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List searchTypeDescriptor = $convert.base64Decode(
    'CgpTZWFyY2hUeXBlEiAKHFNFQVJDSF9UWVBFX0lOX0NVUlJFTlRfU0FMRVMQABIXChNTRUFSQ0'
    'hfVFlQRV9OT1RfWUVUEAESIQodU0VBUkNIX1RZUEVfSVJSRUdVTEFSX0hPTElEQVkQAhIhCh1T'
    'RUFSQ0hfVFlQRV9ORUVEU19SRVNFUlZBVElPThADEh0KGVNFQVJDSF9UWVBFX0JFRVJfQ09DS1'
    'RBSUwQBA==');

@$core.Deprecated('Use sortOrderTypeDescriptor instead')
const SortOrderType$json = {
  '1': 'SortOrderType',
  '2': [
    {'1': 'SORT_ORDER_NO', '2': 0},
    {'1': 'SORT_ORDER_DISTANCE', '2': 1},
  ],
};

/// Descriptor for `SortOrderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sortOrderTypeDescriptor = $convert.base64Decode(
    'Cg1Tb3J0T3JkZXJUeXBlEhEKDVNPUlRfT1JERVJfTk8QABIXChNTT1JUX09SREVSX0RJU1RBTk'
    'NFEAE=');

@$core.Deprecated('Use dateDescriptor instead')
const Date$json = {
  '1': 'Date',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 5, '10': 'month'},
    {'1': 'day', '3': 3, '4': 1, '5': 5, '10': 'day'},
  ],
};

/// Descriptor for `Date`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateDescriptor = $convert.base64Decode(
    'CgREYXRlEhIKBHllYXIYASABKAVSBHllYXISFAoFbW9udGgYAiABKAVSBW1vbnRoEhAKA2RheR'
    'gDIAEoBVIDZGF5');

@$core.Deprecated('Use eventDescriptor instead')
const Event$json = {
  '1': 'Event',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'year', '3': 3, '4': 1, '5': 5, '10': 'year'},
    {'1': 'start_date', '3': 4, '4': 1, '5': 11, '6': '.egp.Date', '10': 'startDate'},
    {'1': 'end_date', '3': 5, '4': 1, '5': 11, '6': '.egp.Date', '10': 'endDate'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgR5ZWFyGAMgAS'
    'gFUgR5ZWFyEigKCnN0YXJ0X2RhdGUYBCABKAsyCS5lZ3AuRGF0ZVIJc3RhcnREYXRlEiQKCGVu'
    'ZF9kYXRlGAUgASgLMgkuZWdwLkRhdGVSB2VuZERhdGU=');

@$core.Deprecated('Use categoryDescriptor instead')
const Category$json = {
  '1': 'Category',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode(
    'CghDYXRlZ29yeRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use categoriesDescriptor instead')
const Categories$json = {
  '1': 'Categories',
  '2': [
    {'1': 'categories', '3': 1, '4': 3, '5': 11, '6': '.egp.Category', '10': 'categories'},
  ],
};

/// Descriptor for `Categories`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoriesDescriptor = $convert.base64Decode(
    'CgpDYXRlZ29yaWVzEi0KCmNhdGVnb3JpZXMYASADKAsyDS5lZ3AuQ2F0ZWdvcnlSCmNhdGVnb3'
    'JpZXM=');

@$core.Deprecated('Use beerTypeDescriptor instead')
const BeerType$json = {
  '1': 'BeerType',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `BeerType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beerTypeDescriptor = $convert.base64Decode(
    'CghCZWVyVHlwZRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use beerTypesDescriptor instead')
const BeerTypes$json = {
  '1': 'BeerTypes',
  '2': [
    {'1': 'beer_types', '3': 1, '4': 3, '5': 11, '6': '.egp.BeerType', '10': 'beerTypes'},
  ],
};

/// Descriptor for `BeerTypes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beerTypesDescriptor = $convert.base64Decode(
    'CglCZWVyVHlwZXMSLAoKYmVlcl90eXBlcxgBIAMoCzINLmVncC5CZWVyVHlwZVIJYmVlclR5cG'
    'Vz');

@$core.Deprecated('Use shopDescriptor instead')
const Shop$json = {
  '1': 'Shop',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'event_id', '3': 2, '4': 1, '5': 3, '10': 'eventId'},
    {'1': 'year', '3': 34, '4': 1, '5': 5, '10': 'year'},
    {'1': 'category_id', '3': 3, '4': 1, '5': 14, '6': '.egp.CategoryType', '10': 'categoryId'},
    {'1': 'category_name', '3': 35, '4': 1, '5': 9, '10': 'categoryName'},
    {'1': 'no', '3': 4, '4': 1, '5': 5, '10': 'no'},
    {'1': 'shop_name', '3': 5, '4': 1, '5': 9, '10': 'shopName'},
    {'1': 'menu_name', '3': 6, '4': 1, '5': 9, '10': 'menuName'},
    {'1': 'menu_image_url', '3': 36, '4': 1, '5': 9, '10': 'menuImageUrl'},
    {'1': 'phone', '3': 7, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'address', '3': 8, '4': 1, '5': 9, '10': 'address'},
    {'1': 'business_days', '3': 9, '4': 1, '5': 9, '10': 'businessDays'},
    {'1': 'regular_holiday', '3': 10, '4': 1, '5': 9, '10': 'regularHoliday'},
    {'1': 'business_hours', '3': 11, '4': 1, '5': 9, '10': 'businessHours'},
    {'1': 'charge_price', '3': 12, '4': 1, '5': 9, '10': 'chargePrice'},
    {'1': 'normalized_charge_price', '3': 13, '4': 1, '5': 5, '10': 'normalizedChargePrice'},
    {'1': 'single_price', '3': 14, '4': 1, '5': 9, '10': 'singlePrice'},
    {'1': 'normalized_single_price', '3': 15, '4': 1, '5': 5, '10': 'normalizedSinglePrice'},
    {'1': 'set_price', '3': 16, '4': 1, '5': 9, '10': 'setPrice'},
    {'1': 'normalized_set_price', '3': 17, '4': 1, '5': 5, '10': 'normalizedSetPrice'},
    {'1': 'beer_type', '3': 18, '4': 1, '5': 9, '10': 'beerType'},
    {'1': 'needs_reservation', '3': 19, '4': 1, '5': 9, '10': 'needsReservation'},
    {'1': 'normalized_needs_reservation', '3': 20, '4': 1, '5': 8, '10': 'normalizedNeedsReservation'},
    {'1': 'use_hachipay', '3': 21, '4': 1, '5': 9, '10': 'useHachipay'},
    {'1': 'normalized_use_hachipay', '3': 22, '4': 1, '5': 8, '10': 'normalizedUseHachipay'},
    {'1': 'is_open_holiday', '3': 23, '4': 1, '5': 8, '10': 'isOpenHoliday'},
    {'1': 'is_irregular_holiday', '3': 24, '4': 1, '5': 8, '10': 'isIrregularHoliday'},
    {'1': 'latitude', '3': 25, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 26, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'distance', '3': 27, '4': 1, '5': 9, '10': 'distance'},
    {'1': 'week_number', '3': 28, '4': 1, '5': 5, '10': 'weekNumber'},
    {'1': 'day_of_week', '3': 29, '4': 1, '5': 5, '10': 'dayOfWeek'},
    {'1': 'start_time', '3': 30, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 31, '4': 1, '5': 9, '10': 'endTime'},
    {'1': 'is_holiday', '3': 32, '4': 1, '5': 8, '10': 'isHoliday'},
    {'1': 'in_current_sales', '3': 33, '4': 1, '5': 8, '10': 'inCurrentSales'},
    {'1': 'is_stamped', '3': 37, '4': 1, '5': 8, '10': 'isStamped'},
    {'1': 'number_of_times', '3': 38, '4': 1, '5': 5, '10': 'numberOfTimes'},
  ],
};

/// Descriptor for `Shop`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopDescriptor = $convert.base64Decode(
    'CgRTaG9wEg4KAmlkGAEgASgDUgJpZBIZCghldmVudF9pZBgCIAEoA1IHZXZlbnRJZBISCgR5ZW'
    'FyGCIgASgFUgR5ZWFyEjIKC2NhdGVnb3J5X2lkGAMgASgOMhEuZWdwLkNhdGVnb3J5VHlwZVIK'
    'Y2F0ZWdvcnlJZBIjCg1jYXRlZ29yeV9uYW1lGCMgASgJUgxjYXRlZ29yeU5hbWUSDgoCbm8YBC'
    'ABKAVSAm5vEhsKCXNob3BfbmFtZRgFIAEoCVIIc2hvcE5hbWUSGwoJbWVudV9uYW1lGAYgASgJ'
    'UghtZW51TmFtZRIkCg5tZW51X2ltYWdlX3VybBgkIAEoCVIMbWVudUltYWdlVXJsEhQKBXBob2'
    '5lGAcgASgJUgVwaG9uZRIYCgdhZGRyZXNzGAggASgJUgdhZGRyZXNzEiMKDWJ1c2luZXNzX2Rh'
    'eXMYCSABKAlSDGJ1c2luZXNzRGF5cxInCg9yZWd1bGFyX2hvbGlkYXkYCiABKAlSDnJlZ3VsYX'
    'JIb2xpZGF5EiUKDmJ1c2luZXNzX2hvdXJzGAsgASgJUg1idXNpbmVzc0hvdXJzEiEKDGNoYXJn'
    'ZV9wcmljZRgMIAEoCVILY2hhcmdlUHJpY2USNgoXbm9ybWFsaXplZF9jaGFyZ2VfcHJpY2UYDS'
    'ABKAVSFW5vcm1hbGl6ZWRDaGFyZ2VQcmljZRIhCgxzaW5nbGVfcHJpY2UYDiABKAlSC3Npbmds'
    'ZVByaWNlEjYKF25vcm1hbGl6ZWRfc2luZ2xlX3ByaWNlGA8gASgFUhVub3JtYWxpemVkU2luZ2'
    'xlUHJpY2USGwoJc2V0X3ByaWNlGBAgASgJUghzZXRQcmljZRIwChRub3JtYWxpemVkX3NldF9w'
    'cmljZRgRIAEoBVISbm9ybWFsaXplZFNldFByaWNlEhsKCWJlZXJfdHlwZRgSIAEoCVIIYmVlcl'
    'R5cGUSKwoRbmVlZHNfcmVzZXJ2YXRpb24YEyABKAlSEG5lZWRzUmVzZXJ2YXRpb24SQAocbm9y'
    'bWFsaXplZF9uZWVkc19yZXNlcnZhdGlvbhgUIAEoCFIabm9ybWFsaXplZE5lZWRzUmVzZXJ2YX'
    'Rpb24SIQoMdXNlX2hhY2hpcGF5GBUgASgJUgt1c2VIYWNoaXBheRI2Chdub3JtYWxpemVkX3Vz'
    'ZV9oYWNoaXBheRgWIAEoCFIVbm9ybWFsaXplZFVzZUhhY2hpcGF5EiYKD2lzX29wZW5faG9saW'
    'RheRgXIAEoCFINaXNPcGVuSG9saWRheRIwChRpc19pcnJlZ3VsYXJfaG9saWRheRgYIAEoCFIS'
    'aXNJcnJlZ3VsYXJIb2xpZGF5EhoKCGxhdGl0dWRlGBkgASgBUghsYXRpdHVkZRIcCglsb25naX'
    'R1ZGUYGiABKAFSCWxvbmdpdHVkZRIaCghkaXN0YW5jZRgbIAEoCVIIZGlzdGFuY2USHwoLd2Vl'
    'a19udW1iZXIYHCABKAVSCndlZWtOdW1iZXISHgoLZGF5X29mX3dlZWsYHSABKAVSCWRheU9mV2'
    'VlaxIdCgpzdGFydF90aW1lGB4gASgJUglzdGFydFRpbWUSGQoIZW5kX3RpbWUYHyABKAlSB2Vu'
    'ZFRpbWUSHQoKaXNfaG9saWRheRggIAEoCFIJaXNIb2xpZGF5EigKEGluX2N1cnJlbnRfc2FsZX'
    'MYISABKAhSDmluQ3VycmVudFNhbGVzEh0KCmlzX3N0YW1wZWQYJSABKAhSCWlzU3RhbXBlZBIm'
    'Cg9udW1iZXJfb2ZfdGltZXMYJiABKAVSDW51bWJlck9mVGltZXM=');

@$core.Deprecated('Use shopLocationDescriptor instead')
const ShopLocation$json = {
  '1': 'ShopLocation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'shop_id', '3': 2, '4': 1, '5': 3, '10': 'shopId'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'location', '3': 5, '4': 1, '5': 9, '10': 'location'},
  ],
};

/// Descriptor for `ShopLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopLocationDescriptor = $convert.base64Decode(
    'CgxTaG9wTG9jYXRpb24SDgoCaWQYASABKANSAmlkEhcKB3Nob3BfaWQYAiABKANSBnNob3BJZB'
    'IaCghsYXRpdHVkZRgDIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAQgASgBUglsb25naXR1'
    'ZGUSGgoIbG9jYXRpb24YBSABKAlSCGxvY2F0aW9u');

@$core.Deprecated('Use shopTimeDescriptor instead')
const ShopTime$json = {
  '1': 'ShopTime',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'shop_id', '3': 2, '4': 1, '5': 3, '10': 'shopId'},
    {'1': 'week_number', '3': 3, '4': 1, '5': 5, '10': 'weekNumber'},
    {'1': 'day_of_week', '3': 4, '4': 1, '5': 5, '10': 'dayOfWeek'},
    {'1': 'start_time', '3': 5, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 6, '4': 1, '5': 9, '10': 'endTime'},
    {'1': 'is_holiday', '3': 7, '4': 1, '5': 8, '10': 'isHoliday'},
  ],
};

/// Descriptor for `ShopTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopTimeDescriptor = $convert.base64Decode(
    'CghTaG9wVGltZRIOCgJpZBgBIAEoA1ICaWQSFwoHc2hvcF9pZBgCIAEoA1IGc2hvcElkEh8KC3'
    'dlZWtfbnVtYmVyGAMgASgFUgp3ZWVrTnVtYmVyEh4KC2RheV9vZl93ZWVrGAQgASgFUglkYXlP'
    'ZldlZWsSHQoKc3RhcnRfdGltZRgFIAEoCVIJc3RhcnRUaW1lEhkKCGVuZF90aW1lGAYgASgJUg'
    'dlbmRUaW1lEh0KCmlzX2hvbGlkYXkYByABKAhSCWlzSG9saWRheQ==');

@$core.Deprecated('Use shopsTotalRequestDescriptor instead')
const ShopsTotalRequest$json = {
  '1': 'ShopsTotalRequest',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
  ],
};

/// Descriptor for `ShopsTotalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopsTotalRequestDescriptor = $convert.base64Decode(
    'ChFTaG9wc1RvdGFsUmVxdWVzdBISCgR5ZWFyGAEgASgFUgR5ZWFy');

@$core.Deprecated('Use shopsTotalResponseDescriptor instead')
const ShopsTotalResponse$json = {
  '1': 'ShopsTotalResponse',
  '2': [
    {'1': 'total_num', '3': 1, '4': 1, '5': 3, '10': 'totalNum'},
  ],
};

/// Descriptor for `ShopsTotalResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopsTotalResponseDescriptor = $convert.base64Decode(
    'ChJTaG9wc1RvdGFsUmVzcG9uc2USGwoJdG90YWxfbnVtGAEgASgDUgh0b3RhbE51bQ==');

@$core.Deprecated('Use shopsRequestDescriptor instead')
const ShopsRequest$json = {
  '1': 'ShopsRequest',
  '2': [
    {'1': 'search_types', '3': 1, '4': 3, '5': 14, '6': '.egp.SearchType', '10': 'searchTypes'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'keyword', '3': 3, '4': 1, '5': 9, '10': 'keyword'},
    {'1': 'year', '3': 4, '4': 1, '5': 5, '10': 'year'},
    {'1': 'sort_order', '3': 5, '4': 1, '5': 14, '6': '.egp.SortOrderType', '10': 'sortOrder'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `ShopsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopsRequestDescriptor = $convert.base64Decode(
    'CgxTaG9wc1JlcXVlc3QSMgoMc2VhcmNoX3R5cGVzGAEgAygOMg8uZWdwLlNlYXJjaFR5cGVSC3'
    'NlYXJjaFR5cGVzEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBIYCgdrZXl3b3JkGAMgASgJUgdr'
    'ZXl3b3JkEhIKBHllYXIYBCABKAVSBHllYXISMQoKc29ydF9vcmRlchgFIAEoDjISLmVncC5Tb3'
    'J0T3JkZXJUeXBlUglzb3J0T3JkZXISGgoIbGF0aXR1ZGUYBiABKAFSCGxhdGl0dWRlEhwKCWxv'
    'bmdpdHVkZRgHIAEoAVIJbG9uZ2l0dWRl');

@$core.Deprecated('Use shopsResponseDescriptor instead')
const ShopsResponse$json = {
  '1': 'ShopsResponse',
  '2': [
    {'1': 'shops', '3': 1, '4': 3, '5': 11, '6': '.egp.Shop', '10': 'shops'},
  ],
};

/// Descriptor for `ShopsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopsResponseDescriptor = $convert.base64Decode(
    'Cg1TaG9wc1Jlc3BvbnNlEh8KBXNob3BzGAEgAygLMgkuZWdwLlNob3BSBXNob3Bz');

@$core.Deprecated('Use shopRequestDescriptor instead')
const ShopRequest$json = {
  '1': 'ShopRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'shop_id', '3': 2, '4': 1, '5': 3, '10': 'shopId'},
  ],
};

/// Descriptor for `ShopRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopRequestDescriptor = $convert.base64Decode(
    'CgtTaG9wUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSFwoHc2hvcF9pZBgCIAEoA1'
    'IGc2hvcElk');

@$core.Deprecated('Use shopResponseDescriptor instead')
const ShopResponse$json = {
  '1': 'ShopResponse',
  '2': [
    {'1': 'shop', '3': 1, '4': 1, '5': 11, '6': '.egp.Shop', '10': 'shop'},
    {'1': 'is_event_period', '3': 2, '4': 1, '5': 8, '10': 'isEventPeriod'},
  ],
};

/// Descriptor for `ShopResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopResponseDescriptor = $convert.base64Decode(
    'CgxTaG9wUmVzcG9uc2USHQoEc2hvcBgBIAEoCzIJLmVncC5TaG9wUgRzaG9wEiYKD2lzX2V2ZW'
    '50X3BlcmlvZBgCIAEoCFINaXNFdmVudFBlcmlvZA==');

@$core.Deprecated('Use stampRequestDescriptor instead')
const StampRequest$json = {
  '1': 'StampRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'shop_id', '3': 2, '4': 1, '5': 3, '10': 'shopId'},
  ],
};

/// Descriptor for `StampRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stampRequestDescriptor = $convert.base64Decode(
    'CgxTdGFtcFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhcKB3Nob3BfaWQYAiABKA'
    'NSBnNob3BJZA==');

@$core.Deprecated('Use stampResponseDescriptor instead')
const StampResponse$json = {
  '1': 'StampResponse',
  '2': [
    {'1': 'number_of_times', '3': 1, '4': 1, '5': 5, '10': 'numberOfTimes'},
  ],
};

/// Descriptor for `StampResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stampResponseDescriptor = $convert.base64Decode(
    'Cg1TdGFtcFJlc3BvbnNlEiYKD251bWJlcl9vZl90aW1lcxgBIAEoBVINbnVtYmVyT2ZUaW1lcw'
    '==');

@$core.Deprecated('Use mergeUserStampRequestDescriptor instead')
const MergeUserStampRequest$json = {
  '1': 'MergeUserStampRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'anonymous_user_id', '3': 2, '4': 1, '5': 9, '10': 'anonymousUserId'},
  ],
};

/// Descriptor for `MergeUserStampRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mergeUserStampRequestDescriptor = $convert.base64Decode(
    'ChVNZXJnZVVzZXJTdGFtcFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEioKEWFub2'
    '55bW91c191c2VyX2lkGAIgASgJUg9hbm9ueW1vdXNVc2VySWQ=');

@$core.Deprecated('Use mergeUserStampResponseDescriptor instead')
const MergeUserStampResponse$json = {
  '1': 'MergeUserStampResponse',
  '2': [
    {'1': 'stamp_num', '3': 1, '4': 1, '5': 5, '10': 'stampNum'},
  ],
};

/// Descriptor for `MergeUserStampResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mergeUserStampResponseDescriptor = $convert.base64Decode(
    'ChZNZXJnZVVzZXJTdGFtcFJlc3BvbnNlEhsKCXN0YW1wX251bRgBIAEoBVIIc3RhbXBOdW0=');

