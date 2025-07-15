//
//  Generated code. Do not modify.
//  source: egp.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'egp.pbenum.dart';

export 'egp.pbenum.dart';

class Date extends $pb.GeneratedMessage {
  factory Date({
    $core.int? year,
    $core.int? month,
    $core.int? day,
  }) {
    final $result = create();
    if (year != null) {
      $result.year = year;
    }
    if (month != null) {
      $result.month = month;
    }
    if (day != null) {
      $result.day = day;
    }
    return $result;
  }
  Date._() : super();
  factory Date.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Date.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Date', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'month', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'day', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Date clone() => Date()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Date copyWith(void Function(Date) updates) => super.copyWith((message) => updates(message as Date)) as Date;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Date create() => Date._();
  Date createEmptyInstance() => create();
  static $pb.PbList<Date> createRepeated() => $pb.PbList<Date>();
  @$core.pragma('dart2js:noInline')
  static Date getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Date>(create);
  static Date? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get day => $_getIZ(2);
  @$pb.TagNumber(3)
  set day($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDay() => clearField(3);
}

class Event extends $pb.GeneratedMessage {
  factory Event({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? year,
    Date? startDate,
    Date? endDate,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (year != null) {
      $result.year = year;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (endDate != null) {
      $result.endDate = endDate;
    }
    return $result;
  }
  Event._() : super();
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Event', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..aOM<Date>(4, _omitFieldNames ? '' : 'startDate', subBuilder: Date.create)
    ..aOM<Date>(5, _omitFieldNames ? '' : 'endDate', subBuilder: Date.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get year => $_getIZ(2);
  @$pb.TagNumber(3)
  set year($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearYear() => clearField(3);

  @$pb.TagNumber(4)
  Date get startDate => $_getN(3);
  @$pb.TagNumber(4)
  set startDate(Date v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartDate() => clearField(4);
  @$pb.TagNumber(4)
  Date ensureStartDate() => $_ensure(3);

  @$pb.TagNumber(5)
  Date get endDate => $_getN(4);
  @$pb.TagNumber(5)
  set endDate(Date v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndDate() => clearField(5);
  @$pb.TagNumber(5)
  Date ensureEndDate() => $_ensure(4);
}

class Category extends $pb.GeneratedMessage {
  factory Category({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Category._() : super();
  factory Category.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Category.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Category', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Category clone() => Category()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Category copyWith(void Function(Category) updates) => super.copyWith((message) => updates(message as Category)) as Category;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Category create() => Category._();
  Category createEmptyInstance() => create();
  static $pb.PbList<Category> createRepeated() => $pb.PbList<Category>();
  @$core.pragma('dart2js:noInline')
  static Category getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Category>(create);
  static Category? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class Categories extends $pb.GeneratedMessage {
  factory Categories({
    $core.Iterable<Category>? categories,
  }) {
    final $result = create();
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    return $result;
  }
  Categories._() : super();
  factory Categories.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Categories.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Categories', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..pc<Category>(1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM, subBuilder: Category.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Categories clone() => Categories()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Categories copyWith(void Function(Categories) updates) => super.copyWith((message) => updates(message as Categories)) as Categories;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Categories create() => Categories._();
  Categories createEmptyInstance() => create();
  static $pb.PbList<Categories> createRepeated() => $pb.PbList<Categories>();
  @$core.pragma('dart2js:noInline')
  static Categories getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Categories>(create);
  static Categories? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Category> get categories => $_getList(0);
}

class BeerType extends $pb.GeneratedMessage {
  factory BeerType({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  BeerType._() : super();
  factory BeerType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BeerType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BeerType', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BeerType clone() => BeerType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BeerType copyWith(void Function(BeerType) updates) => super.copyWith((message) => updates(message as BeerType)) as BeerType;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeerType create() => BeerType._();
  BeerType createEmptyInstance() => create();
  static $pb.PbList<BeerType> createRepeated() => $pb.PbList<BeerType>();
  @$core.pragma('dart2js:noInline')
  static BeerType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BeerType>(create);
  static BeerType? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class BeerTypes extends $pb.GeneratedMessage {
  factory BeerTypes({
    $core.Iterable<BeerType>? beerTypes,
  }) {
    final $result = create();
    if (beerTypes != null) {
      $result.beerTypes.addAll(beerTypes);
    }
    return $result;
  }
  BeerTypes._() : super();
  factory BeerTypes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BeerTypes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BeerTypes', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..pc<BeerType>(1, _omitFieldNames ? '' : 'beerTypes', $pb.PbFieldType.PM, subBuilder: BeerType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BeerTypes clone() => BeerTypes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BeerTypes copyWith(void Function(BeerTypes) updates) => super.copyWith((message) => updates(message as BeerTypes)) as BeerTypes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeerTypes create() => BeerTypes._();
  BeerTypes createEmptyInstance() => create();
  static $pb.PbList<BeerTypes> createRepeated() => $pb.PbList<BeerTypes>();
  @$core.pragma('dart2js:noInline')
  static BeerTypes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BeerTypes>(create);
  static BeerTypes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BeerType> get beerTypes => $_getList(0);
}

class Shop extends $pb.GeneratedMessage {
  factory Shop({
    $fixnum.Int64? id,
    $fixnum.Int64? eventId,
    CategoryType? categoryId,
    $core.int? no,
    $core.String? shopName,
    $core.String? menuName,
    $core.String? phone,
    $core.String? address,
    $core.String? businessDays,
    $core.String? regularHoliday,
    $core.String? businessHours,
    $core.String? chargePrice,
    $core.int? normalizedChargePrice,
    $core.String? singlePrice,
    $core.int? normalizedSinglePrice,
    $core.String? setPrice,
    $core.int? normalizedSetPrice,
    $core.String? beerType,
    $core.String? needsReservation,
    $core.bool? normalizedNeedsReservation,
    $core.String? useHachipay,
    $core.bool? normalizedUseHachipay,
    $core.bool? isOpenHoliday,
    $core.bool? isIrregularHoliday,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? distance,
    $core.int? weekNumber,
    $core.int? dayOfWeek,
    $core.String? startTime,
    $core.String? endTime,
    $core.bool? isHoliday,
    $core.bool? inCurrentSales,
    $core.int? year,
    $core.String? categoryName,
    $core.String? menuImageUrl,
    $core.bool? isStamped,
    $core.int? numberOfTimes,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (eventId != null) {
      $result.eventId = eventId;
    }
    if (categoryId != null) {
      $result.categoryId = categoryId;
    }
    if (no != null) {
      $result.no = no;
    }
    if (shopName != null) {
      $result.shopName = shopName;
    }
    if (menuName != null) {
      $result.menuName = menuName;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (address != null) {
      $result.address = address;
    }
    if (businessDays != null) {
      $result.businessDays = businessDays;
    }
    if (regularHoliday != null) {
      $result.regularHoliday = regularHoliday;
    }
    if (businessHours != null) {
      $result.businessHours = businessHours;
    }
    if (chargePrice != null) {
      $result.chargePrice = chargePrice;
    }
    if (normalizedChargePrice != null) {
      $result.normalizedChargePrice = normalizedChargePrice;
    }
    if (singlePrice != null) {
      $result.singlePrice = singlePrice;
    }
    if (normalizedSinglePrice != null) {
      $result.normalizedSinglePrice = normalizedSinglePrice;
    }
    if (setPrice != null) {
      $result.setPrice = setPrice;
    }
    if (normalizedSetPrice != null) {
      $result.normalizedSetPrice = normalizedSetPrice;
    }
    if (beerType != null) {
      $result.beerType = beerType;
    }
    if (needsReservation != null) {
      $result.needsReservation = needsReservation;
    }
    if (normalizedNeedsReservation != null) {
      $result.normalizedNeedsReservation = normalizedNeedsReservation;
    }
    if (useHachipay != null) {
      $result.useHachipay = useHachipay;
    }
    if (normalizedUseHachipay != null) {
      $result.normalizedUseHachipay = normalizedUseHachipay;
    }
    if (isOpenHoliday != null) {
      $result.isOpenHoliday = isOpenHoliday;
    }
    if (isIrregularHoliday != null) {
      $result.isIrregularHoliday = isIrregularHoliday;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (distance != null) {
      $result.distance = distance;
    }
    if (weekNumber != null) {
      $result.weekNumber = weekNumber;
    }
    if (dayOfWeek != null) {
      $result.dayOfWeek = dayOfWeek;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (isHoliday != null) {
      $result.isHoliday = isHoliday;
    }
    if (inCurrentSales != null) {
      $result.inCurrentSales = inCurrentSales;
    }
    if (year != null) {
      $result.year = year;
    }
    if (categoryName != null) {
      $result.categoryName = categoryName;
    }
    if (menuImageUrl != null) {
      $result.menuImageUrl = menuImageUrl;
    }
    if (isStamped != null) {
      $result.isStamped = isStamped;
    }
    if (numberOfTimes != null) {
      $result.numberOfTimes = numberOfTimes;
    }
    return $result;
  }
  Shop._() : super();
  factory Shop.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Shop.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Shop', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'eventId')
    ..e<CategoryType>(3, _omitFieldNames ? '' : 'categoryId', $pb.PbFieldType.OE, defaultOrMaker: CategoryType.CATEGORY_TYPE_NONE, valueOf: CategoryType.valueOf, enumValues: CategoryType.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'no', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'shopName')
    ..aOS(6, _omitFieldNames ? '' : 'menuName')
    ..aOS(7, _omitFieldNames ? '' : 'phone')
    ..aOS(8, _omitFieldNames ? '' : 'address')
    ..aOS(9, _omitFieldNames ? '' : 'businessDays')
    ..aOS(10, _omitFieldNames ? '' : 'regularHoliday')
    ..aOS(11, _omitFieldNames ? '' : 'businessHours')
    ..aOS(12, _omitFieldNames ? '' : 'chargePrice')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'normalizedChargePrice', $pb.PbFieldType.O3)
    ..aOS(14, _omitFieldNames ? '' : 'singlePrice')
    ..a<$core.int>(15, _omitFieldNames ? '' : 'normalizedSinglePrice', $pb.PbFieldType.O3)
    ..aOS(16, _omitFieldNames ? '' : 'setPrice')
    ..a<$core.int>(17, _omitFieldNames ? '' : 'normalizedSetPrice', $pb.PbFieldType.O3)
    ..aOS(18, _omitFieldNames ? '' : 'beerType')
    ..aOS(19, _omitFieldNames ? '' : 'needsReservation')
    ..aOB(20, _omitFieldNames ? '' : 'normalizedNeedsReservation')
    ..aOS(21, _omitFieldNames ? '' : 'useHachipay')
    ..aOB(22, _omitFieldNames ? '' : 'normalizedUseHachipay')
    ..aOB(23, _omitFieldNames ? '' : 'isOpenHoliday')
    ..aOB(24, _omitFieldNames ? '' : 'isIrregularHoliday')
    ..a<$core.double>(25, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(26, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(27, _omitFieldNames ? '' : 'distance')
    ..a<$core.int>(28, _omitFieldNames ? '' : 'weekNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(29, _omitFieldNames ? '' : 'dayOfWeek', $pb.PbFieldType.O3)
    ..aOS(30, _omitFieldNames ? '' : 'startTime')
    ..aOS(31, _omitFieldNames ? '' : 'endTime')
    ..aOB(32, _omitFieldNames ? '' : 'isHoliday')
    ..aOB(33, _omitFieldNames ? '' : 'inCurrentSales')
    ..a<$core.int>(34, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..aOS(35, _omitFieldNames ? '' : 'categoryName')
    ..aOS(36, _omitFieldNames ? '' : 'menuImageUrl')
    ..aOB(37, _omitFieldNames ? '' : 'isStamped')
    ..a<$core.int>(38, _omitFieldNames ? '' : 'numberOfTimes', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Shop clone() => Shop()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Shop copyWith(void Function(Shop) updates) => super.copyWith((message) => updates(message as Shop)) as Shop;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Shop create() => Shop._();
  Shop createEmptyInstance() => create();
  static $pb.PbList<Shop> createRepeated() => $pb.PbList<Shop>();
  @$core.pragma('dart2js:noInline')
  static Shop getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Shop>(create);
  static Shop? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get eventId => $_getI64(1);
  @$pb.TagNumber(2)
  set eventId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventId() => clearField(2);

  @$pb.TagNumber(3)
  CategoryType get categoryId => $_getN(2);
  @$pb.TagNumber(3)
  set categoryId(CategoryType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCategoryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategoryId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get no => $_getIZ(3);
  @$pb.TagNumber(4)
  set no($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearNo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get shopName => $_getSZ(4);
  @$pb.TagNumber(5)
  set shopName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasShopName() => $_has(4);
  @$pb.TagNumber(5)
  void clearShopName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get menuName => $_getSZ(5);
  @$pb.TagNumber(6)
  set menuName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMenuName() => $_has(5);
  @$pb.TagNumber(6)
  void clearMenuName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get phone => $_getSZ(6);
  @$pb.TagNumber(7)
  set phone($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get address => $_getSZ(7);
  @$pb.TagNumber(8)
  set address($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddress() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get businessDays => $_getSZ(8);
  @$pb.TagNumber(9)
  set businessDays($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBusinessDays() => $_has(8);
  @$pb.TagNumber(9)
  void clearBusinessDays() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get regularHoliday => $_getSZ(9);
  @$pb.TagNumber(10)
  set regularHoliday($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRegularHoliday() => $_has(9);
  @$pb.TagNumber(10)
  void clearRegularHoliday() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get businessHours => $_getSZ(10);
  @$pb.TagNumber(11)
  set businessHours($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasBusinessHours() => $_has(10);
  @$pb.TagNumber(11)
  void clearBusinessHours() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get chargePrice => $_getSZ(11);
  @$pb.TagNumber(12)
  set chargePrice($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasChargePrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearChargePrice() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get normalizedChargePrice => $_getIZ(12);
  @$pb.TagNumber(13)
  set normalizedChargePrice($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasNormalizedChargePrice() => $_has(12);
  @$pb.TagNumber(13)
  void clearNormalizedChargePrice() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get singlePrice => $_getSZ(13);
  @$pb.TagNumber(14)
  set singlePrice($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSinglePrice() => $_has(13);
  @$pb.TagNumber(14)
  void clearSinglePrice() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get normalizedSinglePrice => $_getIZ(14);
  @$pb.TagNumber(15)
  set normalizedSinglePrice($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasNormalizedSinglePrice() => $_has(14);
  @$pb.TagNumber(15)
  void clearNormalizedSinglePrice() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get setPrice => $_getSZ(15);
  @$pb.TagNumber(16)
  set setPrice($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasSetPrice() => $_has(15);
  @$pb.TagNumber(16)
  void clearSetPrice() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get normalizedSetPrice => $_getIZ(16);
  @$pb.TagNumber(17)
  set normalizedSetPrice($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasNormalizedSetPrice() => $_has(16);
  @$pb.TagNumber(17)
  void clearNormalizedSetPrice() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get beerType => $_getSZ(17);
  @$pb.TagNumber(18)
  set beerType($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasBeerType() => $_has(17);
  @$pb.TagNumber(18)
  void clearBeerType() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get needsReservation => $_getSZ(18);
  @$pb.TagNumber(19)
  set needsReservation($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasNeedsReservation() => $_has(18);
  @$pb.TagNumber(19)
  void clearNeedsReservation() => clearField(19);

  @$pb.TagNumber(20)
  $core.bool get normalizedNeedsReservation => $_getBF(19);
  @$pb.TagNumber(20)
  set normalizedNeedsReservation($core.bool v) { $_setBool(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasNormalizedNeedsReservation() => $_has(19);
  @$pb.TagNumber(20)
  void clearNormalizedNeedsReservation() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get useHachipay => $_getSZ(20);
  @$pb.TagNumber(21)
  set useHachipay($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasUseHachipay() => $_has(20);
  @$pb.TagNumber(21)
  void clearUseHachipay() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get normalizedUseHachipay => $_getBF(21);
  @$pb.TagNumber(22)
  set normalizedUseHachipay($core.bool v) { $_setBool(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasNormalizedUseHachipay() => $_has(21);
  @$pb.TagNumber(22)
  void clearNormalizedUseHachipay() => clearField(22);

  @$pb.TagNumber(23)
  $core.bool get isOpenHoliday => $_getBF(22);
  @$pb.TagNumber(23)
  set isOpenHoliday($core.bool v) { $_setBool(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasIsOpenHoliday() => $_has(22);
  @$pb.TagNumber(23)
  void clearIsOpenHoliday() => clearField(23);

  @$pb.TagNumber(24)
  $core.bool get isIrregularHoliday => $_getBF(23);
  @$pb.TagNumber(24)
  set isIrregularHoliday($core.bool v) { $_setBool(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasIsIrregularHoliday() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsIrregularHoliday() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get latitude => $_getN(24);
  @$pb.TagNumber(25)
  set latitude($core.double v) { $_setDouble(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasLatitude() => $_has(24);
  @$pb.TagNumber(25)
  void clearLatitude() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get longitude => $_getN(25);
  @$pb.TagNumber(26)
  set longitude($core.double v) { $_setDouble(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasLongitude() => $_has(25);
  @$pb.TagNumber(26)
  void clearLongitude() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get distance => $_getSZ(26);
  @$pb.TagNumber(27)
  set distance($core.String v) { $_setString(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasDistance() => $_has(26);
  @$pb.TagNumber(27)
  void clearDistance() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get weekNumber => $_getIZ(27);
  @$pb.TagNumber(28)
  set weekNumber($core.int v) { $_setSignedInt32(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasWeekNumber() => $_has(27);
  @$pb.TagNumber(28)
  void clearWeekNumber() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get dayOfWeek => $_getIZ(28);
  @$pb.TagNumber(29)
  set dayOfWeek($core.int v) { $_setSignedInt32(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasDayOfWeek() => $_has(28);
  @$pb.TagNumber(29)
  void clearDayOfWeek() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get startTime => $_getSZ(29);
  @$pb.TagNumber(30)
  set startTime($core.String v) { $_setString(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasStartTime() => $_has(29);
  @$pb.TagNumber(30)
  void clearStartTime() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get endTime => $_getSZ(30);
  @$pb.TagNumber(31)
  set endTime($core.String v) { $_setString(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasEndTime() => $_has(30);
  @$pb.TagNumber(31)
  void clearEndTime() => clearField(31);

  @$pb.TagNumber(32)
  $core.bool get isHoliday => $_getBF(31);
  @$pb.TagNumber(32)
  set isHoliday($core.bool v) { $_setBool(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasIsHoliday() => $_has(31);
  @$pb.TagNumber(32)
  void clearIsHoliday() => clearField(32);

  @$pb.TagNumber(33)
  $core.bool get inCurrentSales => $_getBF(32);
  @$pb.TagNumber(33)
  set inCurrentSales($core.bool v) { $_setBool(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasInCurrentSales() => $_has(32);
  @$pb.TagNumber(33)
  void clearInCurrentSales() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get year => $_getIZ(33);
  @$pb.TagNumber(34)
  set year($core.int v) { $_setSignedInt32(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasYear() => $_has(33);
  @$pb.TagNumber(34)
  void clearYear() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get categoryName => $_getSZ(34);
  @$pb.TagNumber(35)
  set categoryName($core.String v) { $_setString(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasCategoryName() => $_has(34);
  @$pb.TagNumber(35)
  void clearCategoryName() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get menuImageUrl => $_getSZ(35);
  @$pb.TagNumber(36)
  set menuImageUrl($core.String v) { $_setString(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasMenuImageUrl() => $_has(35);
  @$pb.TagNumber(36)
  void clearMenuImageUrl() => clearField(36);

  @$pb.TagNumber(37)
  $core.bool get isStamped => $_getBF(36);
  @$pb.TagNumber(37)
  set isStamped($core.bool v) { $_setBool(36, v); }
  @$pb.TagNumber(37)
  $core.bool hasIsStamped() => $_has(36);
  @$pb.TagNumber(37)
  void clearIsStamped() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get numberOfTimes => $_getIZ(37);
  @$pb.TagNumber(38)
  set numberOfTimes($core.int v) { $_setSignedInt32(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasNumberOfTimes() => $_has(37);
  @$pb.TagNumber(38)
  void clearNumberOfTimes() => clearField(38);
}

class ShopLocation extends $pb.GeneratedMessage {
  factory ShopLocation({
    $fixnum.Int64? id,
    $fixnum.Int64? shopId,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? location,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (shopId != null) {
      $result.shopId = shopId;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  ShopLocation._() : super();
  factory ShopLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'shopId')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(5, _omitFieldNames ? '' : 'location')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopLocation clone() => ShopLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopLocation copyWith(void Function(ShopLocation) updates) => super.copyWith((message) => updates(message as ShopLocation)) as ShopLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopLocation create() => ShopLocation._();
  ShopLocation createEmptyInstance() => create();
  static $pb.PbList<ShopLocation> createRepeated() => $pb.PbList<ShopLocation>();
  @$core.pragma('dart2js:noInline')
  static ShopLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopLocation>(create);
  static ShopLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get shopId => $_getI64(1);
  @$pb.TagNumber(2)
  set shopId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShopId() => $_has(1);
  @$pb.TagNumber(2)
  void clearShopId() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(3)
  set latitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get longitude => $_getN(3);
  @$pb.TagNumber(4)
  set longitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLongitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongitude() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get location => $_getSZ(4);
  @$pb.TagNumber(5)
  set location($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);
}

class ShopTime extends $pb.GeneratedMessage {
  factory ShopTime({
    $fixnum.Int64? id,
    $fixnum.Int64? shopId,
    $core.int? weekNumber,
    $core.int? dayOfWeek,
    $core.String? startTime,
    $core.String? endTime,
    $core.bool? isHoliday,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (shopId != null) {
      $result.shopId = shopId;
    }
    if (weekNumber != null) {
      $result.weekNumber = weekNumber;
    }
    if (dayOfWeek != null) {
      $result.dayOfWeek = dayOfWeek;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (isHoliday != null) {
      $result.isHoliday = isHoliday;
    }
    return $result;
  }
  ShopTime._() : super();
  factory ShopTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'shopId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'weekNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'dayOfWeek', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'startTime')
    ..aOS(6, _omitFieldNames ? '' : 'endTime')
    ..aOB(7, _omitFieldNames ? '' : 'isHoliday')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopTime clone() => ShopTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopTime copyWith(void Function(ShopTime) updates) => super.copyWith((message) => updates(message as ShopTime)) as ShopTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopTime create() => ShopTime._();
  ShopTime createEmptyInstance() => create();
  static $pb.PbList<ShopTime> createRepeated() => $pb.PbList<ShopTime>();
  @$core.pragma('dart2js:noInline')
  static ShopTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopTime>(create);
  static ShopTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get shopId => $_getI64(1);
  @$pb.TagNumber(2)
  set shopId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShopId() => $_has(1);
  @$pb.TagNumber(2)
  void clearShopId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get weekNumber => $_getIZ(2);
  @$pb.TagNumber(3)
  set weekNumber($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWeekNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeekNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get dayOfWeek => $_getIZ(3);
  @$pb.TagNumber(4)
  set dayOfWeek($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDayOfWeek() => $_has(3);
  @$pb.TagNumber(4)
  void clearDayOfWeek() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get startTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set startTime($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get endTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set endTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isHoliday => $_getBF(6);
  @$pb.TagNumber(7)
  set isHoliday($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsHoliday() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsHoliday() => clearField(7);
}

class ShopsTotalRequest extends $pb.GeneratedMessage {
  factory ShopsTotalRequest({
    $core.int? year,
  }) {
    final $result = create();
    if (year != null) {
      $result.year = year;
    }
    return $result;
  }
  ShopsTotalRequest._() : super();
  factory ShopsTotalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopsTotalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsTotalRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopsTotalRequest clone() => ShopsTotalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopsTotalRequest copyWith(void Function(ShopsTotalRequest) updates) => super.copyWith((message) => updates(message as ShopsTotalRequest)) as ShopsTotalRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopsTotalRequest create() => ShopsTotalRequest._();
  ShopsTotalRequest createEmptyInstance() => create();
  static $pb.PbList<ShopsTotalRequest> createRepeated() => $pb.PbList<ShopsTotalRequest>();
  @$core.pragma('dart2js:noInline')
  static ShopsTotalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopsTotalRequest>(create);
  static ShopsTotalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => clearField(1);
}

class ShopsTotalResponse extends $pb.GeneratedMessage {
  factory ShopsTotalResponse({
    $fixnum.Int64? totalNum,
  }) {
    final $result = create();
    if (totalNum != null) {
      $result.totalNum = totalNum;
    }
    return $result;
  }
  ShopsTotalResponse._() : super();
  factory ShopsTotalResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopsTotalResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsTotalResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalNum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopsTotalResponse clone() => ShopsTotalResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopsTotalResponse copyWith(void Function(ShopsTotalResponse) updates) => super.copyWith((message) => updates(message as ShopsTotalResponse)) as ShopsTotalResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopsTotalResponse create() => ShopsTotalResponse._();
  ShopsTotalResponse createEmptyInstance() => create();
  static $pb.PbList<ShopsTotalResponse> createRepeated() => $pb.PbList<ShopsTotalResponse>();
  @$core.pragma('dart2js:noInline')
  static ShopsTotalResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopsTotalResponse>(create);
  static ShopsTotalResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalNum => $_getI64(0);
  @$pb.TagNumber(1)
  set totalNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalNum() => clearField(1);
}

class ShopsRequest extends $pb.GeneratedMessage {
  factory ShopsRequest({
    $core.Iterable<SearchType>? searchTypes,
    $core.String? userId,
    $core.String? keyword,
    $core.int? year,
    SortOrderType? sortOrder,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final $result = create();
    if (searchTypes != null) {
      $result.searchTypes.addAll(searchTypes);
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (keyword != null) {
      $result.keyword = keyword;
    }
    if (year != null) {
      $result.year = year;
    }
    if (sortOrder != null) {
      $result.sortOrder = sortOrder;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  ShopsRequest._() : super();
  factory ShopsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..pc<SearchType>(1, _omitFieldNames ? '' : 'searchTypes', $pb.PbFieldType.KE, valueOf: SearchType.valueOf, enumValues: SearchType.values, defaultEnumValue: SearchType.SEARCH_TYPE_IN_CURRENT_SALES)
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'keyword')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..e<SortOrderType>(5, _omitFieldNames ? '' : 'sortOrder', $pb.PbFieldType.OE, defaultOrMaker: SortOrderType.SORT_ORDER_NO, valueOf: SortOrderType.valueOf, enumValues: SortOrderType.values)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopsRequest clone() => ShopsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopsRequest copyWith(void Function(ShopsRequest) updates) => super.copyWith((message) => updates(message as ShopsRequest)) as ShopsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopsRequest create() => ShopsRequest._();
  ShopsRequest createEmptyInstance() => create();
  static $pb.PbList<ShopsRequest> createRepeated() => $pb.PbList<ShopsRequest>();
  @$core.pragma('dart2js:noInline')
  static ShopsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopsRequest>(create);
  static ShopsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SearchType> get searchTypes => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get keyword => $_getSZ(2);
  @$pb.TagNumber(3)
  set keyword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKeyword() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyword() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get year => $_getIZ(3);
  @$pb.TagNumber(4)
  set year($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasYear() => $_has(3);
  @$pb.TagNumber(4)
  void clearYear() => clearField(4);

  @$pb.TagNumber(5)
  SortOrderType get sortOrder => $_getN(4);
  @$pb.TagNumber(5)
  set sortOrder(SortOrderType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSortOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearSortOrder() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get latitude => $_getN(5);
  @$pb.TagNumber(6)
  set latitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLatitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLatitude() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get longitude => $_getN(6);
  @$pb.TagNumber(7)
  set longitude($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLongitude() => $_has(6);
  @$pb.TagNumber(7)
  void clearLongitude() => clearField(7);
}

class ShopsResponse extends $pb.GeneratedMessage {
  factory ShopsResponse({
    $core.Iterable<Shop>? shops,
  }) {
    final $result = create();
    if (shops != null) {
      $result.shops.addAll(shops);
    }
    return $result;
  }
  ShopsResponse._() : super();
  factory ShopsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..pc<Shop>(1, _omitFieldNames ? '' : 'shops', $pb.PbFieldType.PM, subBuilder: Shop.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopsResponse clone() => ShopsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopsResponse copyWith(void Function(ShopsResponse) updates) => super.copyWith((message) => updates(message as ShopsResponse)) as ShopsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopsResponse create() => ShopsResponse._();
  ShopsResponse createEmptyInstance() => create();
  static $pb.PbList<ShopsResponse> createRepeated() => $pb.PbList<ShopsResponse>();
  @$core.pragma('dart2js:noInline')
  static ShopsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopsResponse>(create);
  static ShopsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Shop> get shops => $_getList(0);
}

class ShopRequest extends $pb.GeneratedMessage {
  factory ShopRequest({
    $core.String? userId,
    $fixnum.Int64? shopId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (shopId != null) {
      $result.shopId = shopId;
    }
    return $result;
  }
  ShopRequest._() : super();
  factory ShopRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aInt64(2, _omitFieldNames ? '' : 'shopId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopRequest clone() => ShopRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopRequest copyWith(void Function(ShopRequest) updates) => super.copyWith((message) => updates(message as ShopRequest)) as ShopRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopRequest create() => ShopRequest._();
  ShopRequest createEmptyInstance() => create();
  static $pb.PbList<ShopRequest> createRepeated() => $pb.PbList<ShopRequest>();
  @$core.pragma('dart2js:noInline')
  static ShopRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopRequest>(create);
  static ShopRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get shopId => $_getI64(1);
  @$pb.TagNumber(2)
  set shopId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShopId() => $_has(1);
  @$pb.TagNumber(2)
  void clearShopId() => clearField(2);
}

class ShopResponse extends $pb.GeneratedMessage {
  factory ShopResponse({
    Shop? shop,
    $core.bool? isEventPeriod,
  }) {
    final $result = create();
    if (shop != null) {
      $result.shop = shop;
    }
    if (isEventPeriod != null) {
      $result.isEventPeriod = isEventPeriod;
    }
    return $result;
  }
  ShopResponse._() : super();
  factory ShopResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aOM<Shop>(1, _omitFieldNames ? '' : 'shop', subBuilder: Shop.create)
    ..aOB(2, _omitFieldNames ? '' : 'isEventPeriod')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopResponse clone() => ShopResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopResponse copyWith(void Function(ShopResponse) updates) => super.copyWith((message) => updates(message as ShopResponse)) as ShopResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShopResponse create() => ShopResponse._();
  ShopResponse createEmptyInstance() => create();
  static $pb.PbList<ShopResponse> createRepeated() => $pb.PbList<ShopResponse>();
  @$core.pragma('dart2js:noInline')
  static ShopResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopResponse>(create);
  static ShopResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Shop get shop => $_getN(0);
  @$pb.TagNumber(1)
  set shop(Shop v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasShop() => $_has(0);
  @$pb.TagNumber(1)
  void clearShop() => clearField(1);
  @$pb.TagNumber(1)
  Shop ensureShop() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isEventPeriod => $_getBF(1);
  @$pb.TagNumber(2)
  set isEventPeriod($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEventPeriod() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEventPeriod() => clearField(2);
}

class StampRequest extends $pb.GeneratedMessage {
  factory StampRequest({
    $core.String? userId,
    $fixnum.Int64? shopId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (shopId != null) {
      $result.shopId = shopId;
    }
    return $result;
  }
  StampRequest._() : super();
  factory StampRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StampRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StampRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aInt64(2, _omitFieldNames ? '' : 'shopId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StampRequest clone() => StampRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StampRequest copyWith(void Function(StampRequest) updates) => super.copyWith((message) => updates(message as StampRequest)) as StampRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StampRequest create() => StampRequest._();
  StampRequest createEmptyInstance() => create();
  static $pb.PbList<StampRequest> createRepeated() => $pb.PbList<StampRequest>();
  @$core.pragma('dart2js:noInline')
  static StampRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StampRequest>(create);
  static StampRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get shopId => $_getI64(1);
  @$pb.TagNumber(2)
  set shopId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShopId() => $_has(1);
  @$pb.TagNumber(2)
  void clearShopId() => clearField(2);
}

class StampResponse extends $pb.GeneratedMessage {
  factory StampResponse({
    $core.int? numberOfTimes,
  }) {
    final $result = create();
    if (numberOfTimes != null) {
      $result.numberOfTimes = numberOfTimes;
    }
    return $result;
  }
  StampResponse._() : super();
  factory StampResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StampResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StampResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'numberOfTimes', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StampResponse clone() => StampResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StampResponse copyWith(void Function(StampResponse) updates) => super.copyWith((message) => updates(message as StampResponse)) as StampResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StampResponse create() => StampResponse._();
  StampResponse createEmptyInstance() => create();
  static $pb.PbList<StampResponse> createRepeated() => $pb.PbList<StampResponse>();
  @$core.pragma('dart2js:noInline')
  static StampResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StampResponse>(create);
  static StampResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numberOfTimes => $_getIZ(0);
  @$pb.TagNumber(1)
  set numberOfTimes($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumberOfTimes() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumberOfTimes() => clearField(1);
}

class MergeUserStampRequest extends $pb.GeneratedMessage {
  factory MergeUserStampRequest({
    $core.String? userId,
    $core.String? anonymousUserId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (anonymousUserId != null) {
      $result.anonymousUserId = anonymousUserId;
    }
    return $result;
  }
  MergeUserStampRequest._() : super();
  factory MergeUserStampRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MergeUserStampRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MergeUserStampRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'anonymousUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MergeUserStampRequest clone() => MergeUserStampRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MergeUserStampRequest copyWith(void Function(MergeUserStampRequest) updates) => super.copyWith((message) => updates(message as MergeUserStampRequest)) as MergeUserStampRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MergeUserStampRequest create() => MergeUserStampRequest._();
  MergeUserStampRequest createEmptyInstance() => create();
  static $pb.PbList<MergeUserStampRequest> createRepeated() => $pb.PbList<MergeUserStampRequest>();
  @$core.pragma('dart2js:noInline')
  static MergeUserStampRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MergeUserStampRequest>(create);
  static MergeUserStampRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get anonymousUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set anonymousUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAnonymousUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnonymousUserId() => clearField(2);
}

class MergeUserStampResponse extends $pb.GeneratedMessage {
  factory MergeUserStampResponse({
    $core.int? stampNum,
  }) {
    final $result = create();
    if (stampNum != null) {
      $result.stampNum = stampNum;
    }
    return $result;
  }
  MergeUserStampResponse._() : super();
  factory MergeUserStampResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MergeUserStampResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MergeUserStampResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'egp'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'stampNum', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MergeUserStampResponse clone() => MergeUserStampResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MergeUserStampResponse copyWith(void Function(MergeUserStampResponse) updates) => super.copyWith((message) => updates(message as MergeUserStampResponse)) as MergeUserStampResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MergeUserStampResponse create() => MergeUserStampResponse._();
  MergeUserStampResponse createEmptyInstance() => create();
  static $pb.PbList<MergeUserStampResponse> createRepeated() => $pb.PbList<MergeUserStampResponse>();
  @$core.pragma('dart2js:noInline')
  static MergeUserStampResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MergeUserStampResponse>(create);
  static MergeUserStampResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get stampNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set stampNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStampNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearStampNum() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
