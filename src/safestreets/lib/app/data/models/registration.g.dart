// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Registration> _$registrationSerializer =
    new _$RegistrationSerializer();

class _$RegistrationSerializer implements StructuredSerializer<Registration> {
  @override
  final Iterable<Type> types = const [Registration, _$Registration];
  @override
  final String wireName = 'Registration';

  @override
  Iterable<Object> serialize(Serializers serializers, Registration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'surname',
      serializers.serialize(object.surname,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Registration deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegistrationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'surname':
          result.surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Registration extends Registration {
  @override
  final String name;
  @override
  final String surname;
  @override
  final String email;
  @override
  final String password;

  factory _$Registration([void Function(RegistrationBuilder) updates]) =>
      (new RegistrationBuilder()..update(updates)).build();

  _$Registration._({this.name, this.surname, this.email, this.password})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Registration', 'name');
    }
    if (surname == null) {
      throw new BuiltValueNullFieldError('Registration', 'surname');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Registration', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('Registration', 'password');
    }
  }

  @override
  Registration rebuild(void Function(RegistrationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationBuilder toBuilder() => new RegistrationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Registration &&
        name == other.name &&
        surname == other.surname &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), surname.hashCode), email.hashCode),
        password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Registration')
          ..add('name', name)
          ..add('surname', surname)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class RegistrationBuilder
    implements Builder<Registration, RegistrationBuilder> {
  _$Registration _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _surname;
  String get surname => _$this._surname;
  set surname(String surname) => _$this._surname = surname;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  RegistrationBuilder();

  RegistrationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _surname = _$v.surname;
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Registration other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Registration;
  }

  @override
  void update(void Function(RegistrationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Registration build() {
    final _$result = _$v ??
        new _$Registration._(
            name: name, surname: surname, email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
