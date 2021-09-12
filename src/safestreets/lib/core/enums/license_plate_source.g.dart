// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_plate_source.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LicensePlateSource _$user = const LicensePlateSource._('user');
const LicensePlateSource _$recognizer =
    const LicensePlateSource._('recognizer');

LicensePlateSource _$valueOf(String name) {
  switch (name) {
    case 'user':
      return _$user;
    case 'recognizer':
      return _$recognizer;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LicensePlateSource> _$values =
    new BuiltSet<LicensePlateSource>(const <LicensePlateSource>[
  _$user,
  _$recognizer,
]);

Serializer<LicensePlateSource> _$licensePlateSourceSerializer =
    new _$LicensePlateSourceSerializer();

class _$LicensePlateSourceSerializer
    implements PrimitiveSerializer<LicensePlateSource> {
  @override
  final Iterable<Type> types = const <Type>[LicensePlateSource];
  @override
  final String wireName = 'LicensePlateSource';

  @override
  Object serialize(Serializers serializers, LicensePlateSource object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  LicensePlateSource deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LicensePlateSource.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
