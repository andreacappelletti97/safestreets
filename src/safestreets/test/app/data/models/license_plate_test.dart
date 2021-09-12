import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'license_plate.json';
  final tLicensePlate = LicensePlate(
    (l) => l
      ..code = 'abc'
      ..licensePlateSource = LicensePlateSource.recognizer,
  );

  test(
      'should be able to convert toJson and then fromJson with the initial model as result',
      () async {
    final jsonFromModel = tLicensePlate.toJson();
    final modelFromJson = LicensePlate.fromJson(jsonFromModel);
    expect(tLicensePlate, modelFromJson);
  });

  group('fromJson', () {
    test('shuold return a valid model', () async {
      final json = fixture(tFixture);
      final result = LicensePlate.fromJson(json);
      expect(result, equals(tLicensePlate));
    });
  });

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = jsonDecode(tLicensePlate.toJson());
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
