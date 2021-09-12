import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/violation.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'violation.json';
  final tViolation = Violation(
    (v) => v..userID = 'abc',
  );

  test(
      'should be able to convert toJson and then fromJson with the initial model as result',
      () async {
    final jsonFromModel = tViolation.toJson();
    final modelFromJson = Violation.fromJson(jsonFromModel);
    expect(tViolation, modelFromJson);
  });

  group('fromJson', () {
    test('shuold return a valid model', () async {
      final json = fixture(tFixture);
      final result = Violation.fromJson(json);
      expect(result, equals(tViolation));
    });
  });

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = jsonDecode(tViolation.toJson());
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
