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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'bcrd.pbenum.dart';

export 'bcrd.pbenum.dart';

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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Date', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Event', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

class Shop extends $pb.GeneratedMessage {
  factory Shop({
    $fixnum.Int64? id,
    $fixnum.Int64? eventId,
    $core.int? year,
    $core.int? no,
    $core.String? shopName,
    $core.String? imageUrl,
    $core.String? googleUrl,
    $core.String? tabelogUrl,
    $core.String? officialUrl,
    $core.String? instagramUrl,
    $core.String? address,
    $core.String? businessDays,
    $core.String? regularHoliday,
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
    if (year != null) {
      $result.year = year;
    }
    if (no != null) {
      $result.no = no;
    }
    if (shopName != null) {
      $result.shopName = shopName;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (googleUrl != null) {
      $result.googleUrl = googleUrl;
    }
    if (tabelogUrl != null) {
      $result.tabelogUrl = tabelogUrl;
    }
    if (officialUrl != null) {
      $result.officialUrl = officialUrl;
    }
    if (instagramUrl != null) {
      $result.instagramUrl = instagramUrl;
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Shop', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'eventId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'no', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'shopName')
    ..aOS(6, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(7, _omitFieldNames ? '' : 'googleUrl')
    ..aOS(8, _omitFieldNames ? '' : 'tabelogUrl')
    ..aOS(9, _omitFieldNames ? '' : 'officialUrl')
    ..aOS(10, _omitFieldNames ? '' : 'instagramUrl')
    ..aOS(11, _omitFieldNames ? '' : 'address')
    ..aOS(12, _omitFieldNames ? '' : 'businessDays')
    ..aOS(13, _omitFieldNames ? '' : 'regularHoliday')
    ..aOB(14, _omitFieldNames ? '' : 'isOpenHoliday')
    ..aOB(15, _omitFieldNames ? '' : 'isIrregularHoliday')
    ..a<$core.double>(16, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(17, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(18, _omitFieldNames ? '' : 'distance')
    ..a<$core.int>(19, _omitFieldNames ? '' : 'weekNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(20, _omitFieldNames ? '' : 'dayOfWeek', $pb.PbFieldType.O3)
    ..aOS(21, _omitFieldNames ? '' : 'startTime')
    ..aOS(22, _omitFieldNames ? '' : 'endTime')
    ..aOB(23, _omitFieldNames ? '' : 'isHoliday')
    ..aOB(24, _omitFieldNames ? '' : 'inCurrentSales')
    ..aOB(25, _omitFieldNames ? '' : 'isStamped')
    ..a<$core.int>(26, _omitFieldNames ? '' : 'numberOfTimes', $pb.PbFieldType.O3)
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
  $core.int get year => $_getIZ(2);
  @$pb.TagNumber(3)
  set year($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearYear() => clearField(3);

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
  $core.String get imageUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set imageUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImageUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearImageUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get googleUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set googleUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGoogleUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearGoogleUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get tabelogUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set tabelogUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTabelogUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearTabelogUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get officialUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set officialUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasOfficialUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearOfficialUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get instagramUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set instagramUrl($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasInstagramUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearInstagramUrl() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get address => $_getSZ(10);
  @$pb.TagNumber(11)
  set address($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAddress() => $_has(10);
  @$pb.TagNumber(11)
  void clearAddress() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get businessDays => $_getSZ(11);
  @$pb.TagNumber(12)
  set businessDays($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasBusinessDays() => $_has(11);
  @$pb.TagNumber(12)
  void clearBusinessDays() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get regularHoliday => $_getSZ(12);
  @$pb.TagNumber(13)
  set regularHoliday($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasRegularHoliday() => $_has(12);
  @$pb.TagNumber(13)
  void clearRegularHoliday() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isOpenHoliday => $_getBF(13);
  @$pb.TagNumber(14)
  set isOpenHoliday($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsOpenHoliday() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsOpenHoliday() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isIrregularHoliday => $_getBF(14);
  @$pb.TagNumber(15)
  set isIrregularHoliday($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsIrregularHoliday() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsIrregularHoliday() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get latitude => $_getN(15);
  @$pb.TagNumber(16)
  set latitude($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasLatitude() => $_has(15);
  @$pb.TagNumber(16)
  void clearLatitude() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get longitude => $_getN(16);
  @$pb.TagNumber(17)
  set longitude($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasLongitude() => $_has(16);
  @$pb.TagNumber(17)
  void clearLongitude() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get distance => $_getSZ(17);
  @$pb.TagNumber(18)
  set distance($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasDistance() => $_has(17);
  @$pb.TagNumber(18)
  void clearDistance() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get weekNumber => $_getIZ(18);
  @$pb.TagNumber(19)
  set weekNumber($core.int v) { $_setSignedInt32(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasWeekNumber() => $_has(18);
  @$pb.TagNumber(19)
  void clearWeekNumber() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get dayOfWeek => $_getIZ(19);
  @$pb.TagNumber(20)
  set dayOfWeek($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasDayOfWeek() => $_has(19);
  @$pb.TagNumber(20)
  void clearDayOfWeek() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get startTime => $_getSZ(20);
  @$pb.TagNumber(21)
  set startTime($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasStartTime() => $_has(20);
  @$pb.TagNumber(21)
  void clearStartTime() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get endTime => $_getSZ(21);
  @$pb.TagNumber(22)
  set endTime($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasEndTime() => $_has(21);
  @$pb.TagNumber(22)
  void clearEndTime() => clearField(22);

  @$pb.TagNumber(23)
  $core.bool get isHoliday => $_getBF(22);
  @$pb.TagNumber(23)
  set isHoliday($core.bool v) { $_setBool(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasIsHoliday() => $_has(22);
  @$pb.TagNumber(23)
  void clearIsHoliday() => clearField(23);

  @$pb.TagNumber(24)
  $core.bool get inCurrentSales => $_getBF(23);
  @$pb.TagNumber(24)
  set inCurrentSales($core.bool v) { $_setBool(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasInCurrentSales() => $_has(23);
  @$pb.TagNumber(24)
  void clearInCurrentSales() => clearField(24);

  @$pb.TagNumber(25)
  $core.bool get isStamped => $_getBF(24);
  @$pb.TagNumber(25)
  set isStamped($core.bool v) { $_setBool(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasIsStamped() => $_has(24);
  @$pb.TagNumber(25)
  void clearIsStamped() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get numberOfTimes => $_getIZ(25);
  @$pb.TagNumber(26)
  set numberOfTimes($core.int v) { $_setSignedInt32(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasNumberOfTimes() => $_has(25);
  @$pb.TagNumber(26)
  void clearNumberOfTimes() => clearField(26);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsTotalRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsTotalResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShopResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StampRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StampResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MergeUserStampRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MergeUserStampResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'bcrd'), createEmptyInstance: create)
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
