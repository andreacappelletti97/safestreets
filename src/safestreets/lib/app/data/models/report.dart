import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/core/enums/violation_type.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'report.g.dart';

abstract class Report implements Built<Report, ReportBuilder> {
  // Fields
  LicensePlate get licensePlate;
  String get userID;
  Location get location;
  ViolationType get violationType;
  Image get image;

  Report._();

  factory Report([void Function(ReportBuilder) updates]) = _$Report;

  String toJson() {
    return json.encode(serializers.serializeWith(Report.serializer, this));
  }

  static Report fromJson(String jsonString) {
    return serializers.deserializeWith(
        Report.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJson(),
    );
  }

  static Serializer<Report> get serializer => _$reportSerializer;
}
