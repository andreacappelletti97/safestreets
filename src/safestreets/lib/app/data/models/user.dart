import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  // Fields
  String get userID;
  String get email;
  bool get authority;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJson(),
    );
  }

  static Serializer<User> get serializer => _$userSerializer;
}
