import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/enums/violation_type.dart';
import 'package:safestreets/core/services/report_validation_service.dart';

void main() {
  ReportValidationService service;

  setUp(() {
    service = ReportValidationService();
  });

  group('call', () {
    final tReportValid = Report(
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

    final tReportInvalid = Report(
      (r) => r
        ..userID = ''
        ..violationType = ViolationType.generic
        ..image = Image(
          (i) => i
            ..file = File('file')
            ..name = 'file',
        ).toBuilder()
        ..licensePlate = LicensePlate(
          (l) => l
            ..code = ''
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

    test('should return true when Report is valid', () async {
      final result = service(tReportValid);
      expect(result, true);
    });

    test('should return false when Report is invalid', () async {
      final result = service(tReportInvalid);
      expect(result, false);
    });
  });
}
