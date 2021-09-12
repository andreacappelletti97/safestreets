// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ViolationType _$generic = const ViolationType._('generic');
const ViolationType _$parking = const ViolationType._('parking');
const ViolationType _$noAuth = const ViolationType._('noAuth');
const ViolationType _$noPay = const ViolationType._('noPay');

ViolationType _$valueOf(String name) {
  switch (name) {
    case 'generic':
      return _$generic;
    case 'parking':
      return _$parking;
    case 'noAuth':
      return _$noAuth;
    case 'noPay':
      return _$noPay;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ViolationType> _$values =
    new BuiltSet<ViolationType>(const <ViolationType>[
  _$generic,
  _$parking,
  _$noAuth,
  _$noPay,
]);

Serializer<ViolationType> _$violationTypeSerializer =
    new _$ViolationTypeSerializer();

class _$ViolationTypeSerializer implements PrimitiveSerializer<ViolationType> {
  @override
  final Iterable<Type> types = const <Type>[ViolationType];
  @override
  final String wireName = 'ViolationType';

  @override
  Object serialize(Serializers serializers, ViolationType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ViolationType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ViolationType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
