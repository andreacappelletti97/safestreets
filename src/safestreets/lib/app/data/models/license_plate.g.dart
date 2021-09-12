// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_plate.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LicensePlate> _$licensePlateSerializer =
    new _$LicensePlateSerializer();

class _$LicensePlateSerializer implements StructuredSerializer<LicensePlate> {
  @override
  final Iterable<Type> types = const [LicensePlate, _$LicensePlate];
  @override
  final String wireName = 'LicensePlate';

  @override
  Iterable<Object> serialize(Serializers serializers, LicensePlate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'licensePlateSource',
      serializers.serialize(object.licensePlateSource,
          specifiedType: const FullType(LicensePlateSource)),
    ];

    return result;
  }

  @override
  LicensePlate deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LicensePlateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'licensePlateSource':
          result.licensePlateSource = serializers.deserialize(value,
                  specifiedType: const FullType(LicensePlateSource))
              as LicensePlateSource;
          break;
      }
    }

    return result.build();
  }
}

class _$LicensePlate extends LicensePlate {
  @override
  final String code;
  @override
  final LicensePlateSource licensePlateSource;

  factory _$LicensePlate([void Function(LicensePlateBuilder) updates]) =>
      (new LicensePlateBuilder()..update(updates)).build();

  _$LicensePlate._({this.code, this.licensePlateSource}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('LicensePlate', 'code');
    }
    if (licensePlateSource == null) {
      throw new BuiltValueNullFieldError('LicensePlate', 'licensePlateSource');
    }
  }

  @override
  LicensePlate rebuild(void Function(LicensePlateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LicensePlateBuilder toBuilder() => new LicensePlateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LicensePlate &&
        code == other.code &&
        licensePlateSource == other.licensePlateSource;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, code.hashCode), licensePlateSource.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LicensePlate')
          ..add('code', code)
          ..add('licensePlateSource', licensePlateSource))
        .toString();
  }
}

class LicensePlateBuilder
    implements Builder<LicensePlate, LicensePlateBuilder> {
  _$LicensePlate _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  LicensePlateSource _licensePlateSource;
  LicensePlateSource get licensePlateSource => _$this._licensePlateSource;
  set licensePlateSource(LicensePlateSource licensePlateSource) =>
      _$this._licensePlateSource = licensePlateSource;

  LicensePlateBuilder();

  LicensePlateBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _licensePlateSource = _$v.licensePlateSource;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LicensePlate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LicensePlate;
  }

  @override
  void update(void Function(LicensePlateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LicensePlate build() {
    final _$result = _$v ??
        new _$LicensePlate._(
            code: code, licensePlateSource: licensePlateSource);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
