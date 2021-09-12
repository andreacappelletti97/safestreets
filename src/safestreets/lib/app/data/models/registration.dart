import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'registration.g.dart';

abstract class Registration implements Built<Registration, RegistrationBuilder> {
  String get name;
  String get surname;
  String get email;
  String get password;

  Registration._();

  factory Registration([void Function(RegistrationBuilder) updates]) = _$Registration;

  String toJson() {
    return json.encode(serializers.serializeWith(Registration.serializer, this));
  }

  static Registration fromJson(String jsonString) {
    return serializers.deserializeWith(
        Registration.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJson(),
    );
  }

  static Serializer<Registration> get serializer => _$registrationSerializer;
}