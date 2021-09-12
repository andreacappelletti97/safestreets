// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Violation> _$violationSerializer = new _$ViolationSerializer();

class _$ViolationSerializer implements StructuredSerializer<Violation> {
  @override
  final Iterable<Type> types = const [Violation, _$Violation];
  @override
  final String wireName = 'Violation';

  @override
  Iterable<Object> serialize(Serializers serializers, Violation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userID',
      serializers.serialize(object.userID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Violation deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ViolationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Violation extends Violation {
  @override
  final String userID;

  factory _$Violation([void Function(ViolationBuilder) updates]) =>
      (new ViolationBuilder()..update(updates)).build();

  _$Violation._({this.userID}) : super._() {
    if (userID == null) {
      throw new BuiltValueNullFieldError('Violation', 'userID');
    }
  }

  @override
  Violation rebuild(void Function(ViolationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ViolationBuilder toBuilder() => new ViolationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Violation && userID == other.userID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Violation')..add('userID', userID))
        .toString();
  }
}

class ViolationBuilder implements Builder<Violation, ViolationBuilder> {
  _$Violation _$v;

  String _userID;
  String get userID => _$this._userID;
  set userID(String userID) => _$this._userID = userID;

  ViolationBuilder();

  ViolationBuilder get _$this {
    if (_$v != null) {
      _userID = _$v.userID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Violation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Violation;
  }

  @override
  void update(void Function(ViolationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Violation build() {
    final _$result = _$v ?? new _$Violation._(userID: userID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
