import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {
  Position get position;

  Location._();

  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  String toJson() {
    return json.encode(serializers.serializeWith(Location.serializer, this));
  }

  static Location fromJson(String jsonString) {
    return serializers.deserializeWith(
        Location.serializer, json.decode(jsonString));
  }

  static Serializer<Location> get serializer => _$locationSerializer;
}
