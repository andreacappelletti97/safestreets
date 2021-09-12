import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/enums/violation_type.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'report.json';
  final tReport = Report(
    (r) => r
      ..userID = 'abc'
      ..violationType = ViolationType.generic
      ..image = Image(
        (i) => i
          ..file = File('file')
          ..name = 'file',
      ).toBuilder()
      ..licensePlate = LicensePlate(
        (l) => l
          ..code = 'abc'
          ..licensePlateSource = LicensePlateSource.recognizer,
      ).toBuilder()
      ..location = Location(
        (l) => l
          ..position = Position(
            latitude: 0,
            longitude: 0,
          ),
      ).toBuilder(),
  );

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = jsonDecode(tReport.toJson());
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
