// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Request> _$requestSerializer = new _$RequestSerializer();

class _$RequestSerializer implements StructuredSerializer<Request> {
  @override
  final Iterable<Type> types = const [Request, _$Request];
  @override
  final String wireName = 'Request';

  @override
  Iterable<Object> serialize(Serializers serializers, Request object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'violationType',
      serializers.serialize(object.violationType,
          specifiedType: const FullType(String)),
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
      'licensePlate',
      serializers.serialize(object.licensePlate,
          specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Request deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'violationType':
          result.violationType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'licensePlate':
          result.licensePlate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Request extends Request {
  @override
  final String violationType;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String licensePlate;
  @override
  final String imageUrl;

  factory _$Request([void Function(RequestBuilder) updates]) =>
      (new RequestBuilder()..update(updates)).build();

  _$Request._(
      {this.violationType,
      this.latitude,
      this.longitude,
      this.licensePlate,
      this.imageUrl})
      : super._() {
    if (violationType == null) {
      throw new BuiltValueNullFieldError('Request', 'violationType');
    }
    if (latitude == null) {
      throw new BuiltValueNullFieldError('Request', 'latitude');
    }
    if (longitude == null) {
      throw new BuiltValueNullFieldError('Request', 'longitude');
    }
    if (licensePlate == null) {
      throw new BuiltValueNullFieldError('Request', 'licensePlate');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('Request', 'imageUrl');
    }
  }

  @override
  Request rebuild(void Function(RequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestBuilder toBuilder() => new RequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Request &&
        violationType == other.violationType &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        licensePlate == other.licensePlate &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, violationType.hashCode), latitude.hashCode),
                longitude.hashCode),
            licensePlate.hashCode),
        imageUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Request')
          ..add('violationType', violationType)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('licensePlate', licensePlate)
          ..add('imageUrl', imageUrl))
        .toString();
  }
}

class RequestBuilder implements Builder<Request, RequestBuilder> {
  _$Request _$v;

  String _violationType;
  String get violationType => _$this._violationType;
  set violationType(String violationType) =>
      _$this._violationType = violationType;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  String _licensePlate;
  String get licensePlate => _$this._licensePlate;
  set licensePlate(String licensePlate) => _$this._licensePlate = licensePlate;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  RequestBuilder();

  RequestBuilder get _$this {
    if (_$v != null) {
      _violationType = _$v.violationType;
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _licensePlate = _$v.licensePlate;
      _imageUrl = _$v.imageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Request other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Request;
  }

  @override
  void update(void Function(RequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Request build() {
    final _$result = _$v ??
        new _$Request._(
            violationType: violationType,
            latitude: latitude,
            longitude: longitude,
            licensePlate: licensePlate,
            imageUrl: imageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
