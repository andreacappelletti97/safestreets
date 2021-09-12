import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'request.g.dart';

abstract class Request implements Built<Request, RequestBuilder> {
  // Fields
  String get violationType;
  double get latitude;
  double get longitude;
  String get licensePlate;
  String get imageUrl;

  Request._();

  factory Request([void Function(RequestBuilder) updates]) = _$Request;

  String toJson() {
    return json.encode(serializers.serializeWith(Request.serializer, this));
  }

  static Request fromJson(String jsonString) {
    return serializers.deserializeWith(
        Request.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJson(),
    );
  }

  static Serializer<Request> get serializer => _$requestSerializer;
}
