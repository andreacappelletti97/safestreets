import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'license_plate.g.dart';

abstract class LicensePlate
    implements Built<LicensePlate, LicensePlateBuilder> {
  String get code;
  LicensePlateSource get licensePlateSource;

  LicensePlate._();

  factory LicensePlate([void Function(LicensePlateBuilder) updates]) =
      _$LicensePlate;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LicensePlate.serializer, this));
  }

  static LicensePlate fromJson(String jsonString) {
    return serializers.deserializeWith(
        LicensePlate.serializer, json.decode(jsonString));
  }

  static Serializer<LicensePlate> get serializer => _$licensePlateSerializer;
}
