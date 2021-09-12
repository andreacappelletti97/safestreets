// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Report> _$reportSerializer = new _$ReportSerializer();

class _$ReportSerializer implements StructuredSerializer<Report> {
  @override
  final Iterable<Type> types = const [Report, _$Report];
  @override
  final String wireName = 'Report';

  @override
  Iterable<Object> serialize(Serializers serializers, Report object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'licensePlate',
      serializers.serialize(object.licensePlate,
          specifiedType: const FullType(LicensePlate)),
      'userID',
      serializers.serialize(object.userID,
          specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(Location)),
      'violationType',
      serializers.serialize(object.violationType,
          specifiedType: const FullType(ViolationType)),
      'image',
      serializers.serialize(object.image, specifiedType: const FullType(Image)),
    ];

    return result;
  }

  @override
  Report deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'licensePlate':
          result.licensePlate.replace(serializers.deserialize(value,
              specifiedType: const FullType(LicensePlate)) as LicensePlate);
          break;
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(Location)) as Location);
          break;
        case 'violationType':
          result.violationType = serializers.deserialize(value,
              specifiedType: const FullType(ViolationType)) as ViolationType;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(Image)) as Image);
          break;
      }
    }

    return result.build();
  }
}

class _$Report extends Report {
  @override
  final LicensePlate licensePlate;
  @override
  final String userID;
  @override
  final Location location;
  @override
  final ViolationType violationType;
  @override
  final Image image;

  factory _$Report([void Function(ReportBuilder) updates]) =>
      (new ReportBuilder()..update(updates)).build();

  _$Report._(
      {this.licensePlate,
      this.userID,
      this.location,
      this.violationType,
      this.image})
      : super._() {
    if (licensePlate == null) {
      throw new BuiltValueNullFieldError('Report', 'licensePlate');
    }
    if (userID == null) {
      throw new BuiltValueNullFieldError('Report', 'userID');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('Report', 'location');
    }
    if (violationType == null) {
      throw new BuiltValueNullFieldError('Report', 'violationType');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('Report', 'image');
    }
  }

  @override
  Report rebuild(void Function(ReportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportBuilder toBuilder() => new ReportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Report &&
        licensePlate == other.licensePlate &&
        userID == other.userID &&
        location == other.location &&
        violationType == other.violationType &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, licensePlate.hashCode), userID.hashCode),
                location.hashCode),
            violationType.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Report')
          ..add('licensePlate', licensePlate)
          ..add('userID', userID)
          ..add('location', location)
          ..add('violationType', violationType)
          ..add('image', image))
        .toString();
  }
}

class ReportBuilder implements Builder<Report, ReportBuilder> {
  _$Report _$v;

  LicensePlateBuilder _licensePlate;
  LicensePlateBuilder get licensePlate =>
      _$this._licensePlate ??= new LicensePlateBuilder();
  set licensePlate(LicensePlateBuilder licensePlate) =>
      _$this._licensePlate = licensePlate;

  String _userID;
  String get userID => _$this._userID;
  set userID(String userID) => _$this._userID = userID;

  LocationBuilder _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder location) => _$this._location = location;

  ViolationType _violationType;
  ViolationType get violationType => _$this._violationType;
  set violationType(ViolationType violationType) =>
      _$this._violationType = violationType;

  ImageBuilder _image;
  ImageBuilder get image => _$this._image ??= new ImageBuilder();
  set image(ImageBuilder image) => _$this._image = image;

  ReportBuilder();

  ReportBuilder get _$this {
    if (_$v != null) {
      _licensePlate = _$v.licensePlate?.toBuilder();
      _userID = _$v.userID;
      _location = _$v.location?.toBuilder();
      _violationType = _$v.violationType;
      _image = _$v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Report other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Report;
  }

  @override
  void update(void Function(ReportBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Report build() {
    _$Report _$result;
    try {
      _$result = _$v ??
          new _$Report._(
              licensePlate: licensePlate.build(),
              userID: userID,
              location: location.build(),
              violationType: violationType,
              image: image.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'licensePlate';
        licensePlate.build();

        _$failedField = 'location';
        location.build();

        _$failedField = 'image';
        image.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Report', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
