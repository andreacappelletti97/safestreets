import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'violation.g.dart';

abstract class Violation implements Built<Violation, ViolationBuilder> {
  // Fields
  String get userID;


  Violation._();

  factory Violation([void Function(ViolationBuilder) updates]) = _$Violation;

  String toJson() {
    return json.encode(serializers.serializeWith(Violation.serializer, this));
  }

  static Violation fromJson(String jsonString) {
    return serializers.deserializeWith(
        Violation.serializer, json.decode(jsonString));
  }

  static Serializer<Violation> get serializer => _$violationSerializer;
}
