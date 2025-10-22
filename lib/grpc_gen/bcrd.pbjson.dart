//
//  Generated code. Do not modify.
//  source: bcrd.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use searchTypeDescriptor instead')
const SearchType$json = {
  '1': 'SearchType',
  '2': [
    {'1': 'SEARCH_TYPE_IN_CURRENT_SALES', '2': 0},
    {'1': 'SEARCH_TYPE_NOT_YET', '2': 1},
    {'1': 'SEARCH_TYPE_IRREGULAR_HOLIDAY', '2': 2},
  ],
};

/// Descriptor for `SearchType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List searchTypeDescriptor = $convert.base64Decode(
    'CgpTZWFyY2hUeXBlEiAKHFNFQVJDSF9UWVBFX0lOX0NVUlJFTlRfU0FMRVMQABIXChNTRUFSQ0'
    'hfVFlQRV9OT1RfWUVUEAESIQodU0VBUkNIX1RZUEVfSVJSRUdVTEFSX0hPTElEQVkQAg==');

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
    {'1': 'start_date', '3': 4, '4': 1, '5': 11, '6': '.bcrd.Date', '10': 'startDate'},
    {'1': 'end_date', '3': 5, '4': 1, '5': 11, '6': '.bcrd.Date', '10': 'endDate'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgR5ZWFyGAMgAS'
    'gFUgR5ZWFyEikKCnN0YXJ0X2RhdGUYBCABKAsyCi5iY3JkLkRhdGVSCXN0YXJ0RGF0ZRIlCghl'
    'bmRfZGF0ZRgFIAEoCzIKLmJjcmQuRGF0ZVIHZW5kRGF0ZQ==');

@$core.Deprecated('Use shopDescriptor instead')
const Shop$json = {
  '1': 'Shop',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'event_id', '3': 2, '4': 1, '5': 3, '10': 'eventId'},
    {'1': 'year', '3': 3, '4': 1, '5': 5, '10': 'year'},
    {'1': 'no', '3': 4, '4': 1, '5': 5, '10': 'no'},
    {'1': 'shop_name', '3': 5, '4': 1, '5': 9, '10': 'shopName'},
    {'1': 'image_url', '3': 6, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'google_url', '3': 7, '4': 1, '5': 9, '10': 'googleUrl'},
    {'1': 'tabelog_url', '3': 8, '4': 1, '5': 9, '10': 'tabelogUrl'},
    {'1': 'official_url', '3': 9, '4': 1, '5': 9, '10': 'officialUrl'},
    {'1': 'instagram_url', '3': 10, '4': 1, '5': 9, '10': 'instagramUrl'},
    {'1': 'address', '3': 11, '4': 1, '5': 9, '10': 'address'},
    {'1': 'business_days', '3': 12, '4': 1, '5': 9, '10': 'businessDays'},
    {'1': 'regular_holiday', '3': 13, '4': 1, '5': 9, '10': 'regularHoliday'},
    {'1': 'is_open_holiday', '3': 14, '4': 1, '5': 8, '10': 'isOpenHoliday'},
    {'1': 'is_irregular_holiday', '3': 15, '4': 1, '5': 8, '10': 'isIrregularHoliday'},
    {'1': 'latitude', '3': 16, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 17, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'distance', '3': 18, '4': 1, '5': 9, '10': 'distance'},
    {'1': 'week_number', '3': 19, '4': 1, '5': 5, '10': 'weekNumber'},
    {'1': 'day_of_week', '3': 20, '4': 1, '5': 5, '10': 'dayOfWeek'},
    {'1': 'start_time', '3': 21, '4': 1, '5': 9, '10': 'startTime'},
    {'1': 'end_time', '3': 22, '4': 1, '5': 9, '10': 'endTime'},
    {'1': 'is_holiday', '3': 23, '4': 1, '5': 8, '10': 'isHoliday'},
    {'1': 'in_current_sales', '3': 24, '4': 1, '5': 8, '10': 'inCurrentSales'},
    {'1': 'is_stamped', '3': 25, '4': 1, '5': 8, '10': 'isStamped'},
    {'1': 'number_of_times', '3': 26, '4': 1, '5': 5, '10': 'numberOfTimes'},
    {'1': 'place_id', '3': 27, '4': 1, '5': 9, '10': 'placeId'},
  ],
};

/// Descriptor for `Shop`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopDescriptor = $convert.base64Decode(
    'CgRTaG9wEg4KAmlkGAEgASgDUgJpZBIZCghldmVudF9pZBgCIAEoA1IHZXZlbnRJZBISCgR5ZW'
    'FyGAMgASgFUgR5ZWFyEg4KAm5vGAQgASgFUgJubxIbCglzaG9wX25hbWUYBSABKAlSCHNob3BO'
    'YW1lEhsKCWltYWdlX3VybBgGIAEoCVIIaW1hZ2VVcmwSHQoKZ29vZ2xlX3VybBgHIAEoCVIJZ2'
    '9vZ2xlVXJsEh8KC3RhYmVsb2dfdXJsGAggASgJUgp0YWJlbG9nVXJsEiEKDG9mZmljaWFsX3Vy'
    'bBgJIAEoCVILb2ZmaWNpYWxVcmwSIwoNaW5zdGFncmFtX3VybBgKIAEoCVIMaW5zdGFncmFtVX'
    'JsEhgKB2FkZHJlc3MYCyABKAlSB2FkZHJlc3MSIwoNYnVzaW5lc3NfZGF5cxgMIAEoCVIMYnVz'
    'aW5lc3NEYXlzEicKD3JlZ3VsYXJfaG9saWRheRgNIAEoCVIOcmVndWxhckhvbGlkYXkSJgoPaX'
    'Nfb3Blbl9ob2xpZGF5GA4gASgIUg1pc09wZW5Ib2xpZGF5EjAKFGlzX2lycmVndWxhcl9ob2xp'
    'ZGF5GA8gASgIUhJpc0lycmVndWxhckhvbGlkYXkSGgoIbGF0aXR1ZGUYECABKAFSCGxhdGl0dW'
    'RlEhwKCWxvbmdpdHVkZRgRIAEoAVIJbG9uZ2l0dWRlEhoKCGRpc3RhbmNlGBIgASgJUghkaXN0'
    'YW5jZRIfCgt3ZWVrX251bWJlchgTIAEoBVIKd2Vla051bWJlchIeCgtkYXlfb2Zfd2VlaxgUIA'
    'EoBVIJZGF5T2ZXZWVrEh0KCnN0YXJ0X3RpbWUYFSABKAlSCXN0YXJ0VGltZRIZCghlbmRfdGlt'
    'ZRgWIAEoCVIHZW5kVGltZRIdCgppc19ob2xpZGF5GBcgASgIUglpc0hvbGlkYXkSKAoQaW5fY3'
    'VycmVudF9zYWxlcxgYIAEoCFIOaW5DdXJyZW50U2FsZXMSHQoKaXNfc3RhbXBlZBgZIAEoCFIJ'
    'aXNTdGFtcGVkEiYKD251bWJlcl9vZl90aW1lcxgaIAEoBVINbnVtYmVyT2ZUaW1lcxIZCghwbG'
    'FjZV9pZBgbIAEoCVIHcGxhY2VJZA==');

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
    {'1': 'search_types', '3': 1, '4': 3, '5': 14, '6': '.bcrd.SearchType', '10': 'searchTypes'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'keyword', '3': 3, '4': 1, '5': 9, '10': 'keyword'},
    {'1': 'year', '3': 4, '4': 1, '5': 5, '10': 'year'},
    {'1': 'sort_order', '3': 5, '4': 1, '5': 14, '6': '.bcrd.SortOrderType', '10': 'sortOrder'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `ShopsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopsRequestDescriptor = $convert.base64Decode(
    'CgxTaG9wc1JlcXVlc3QSMwoMc2VhcmNoX3R5cGVzGAEgAygOMhAuYmNyZC5TZWFyY2hUeXBlUg'
    'tzZWFyY2hUeXBlcxIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSGAoHa2V5d29yZBgDIAEoCVIH'
    'a2V5d29yZBISCgR5ZWFyGAQgASgFUgR5ZWFyEjIKCnNvcnRfb3JkZXIYBSABKA4yEy5iY3JkLl'
    'NvcnRPcmRlclR5cGVSCXNvcnRPcmRlchIaCghsYXRpdHVkZRgGIAEoAVIIbGF0aXR1ZGUSHAoJ'
    'bG9uZ2l0dWRlGAcgASgBUglsb25naXR1ZGU=');

@$core.Deprecated('Use shopsResponseDescriptor instead')
const ShopsResponse$json = {
  '1': 'ShopsResponse',
  '2': [
    {'1': 'shops', '3': 1, '4': 3, '5': 11, '6': '.bcrd.Shop', '10': 'shops'},
  ],
};

/// Descriptor for `ShopsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopsResponseDescriptor = $convert.base64Decode(
    'Cg1TaG9wc1Jlc3BvbnNlEiAKBXNob3BzGAEgAygLMgouYmNyZC5TaG9wUgVzaG9wcw==');

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
    {'1': 'shop', '3': 1, '4': 1, '5': 11, '6': '.bcrd.Shop', '10': 'shop'},
    {'1': 'is_event_period', '3': 2, '4': 1, '5': 8, '10': 'isEventPeriod'},
  ],
};

/// Descriptor for `ShopResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopResponseDescriptor = $convert.base64Decode(
    'CgxTaG9wUmVzcG9uc2USHgoEc2hvcBgBIAEoCzIKLmJjcmQuU2hvcFIEc2hvcBImCg9pc19ldm'
    'VudF9wZXJpb2QYAiABKAhSDWlzRXZlbnRQZXJpb2Q=');

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

