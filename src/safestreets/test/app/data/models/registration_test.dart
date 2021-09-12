import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/registration.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'registration.json';
  final tRegistration = Registration(
    (r) => r
      ..email = 'email'
      ..name = 'name'
      ..surname = 'surname'
      ..password = '123',
  );

  test(
      'should be able to convert toJson and then fromJson with the initial model as result',
      () async {
    final jsonFromModel = tRegistration.toJson();
    final modelFromJson = Registration.fromJson(jsonFromModel);
    expect(tRegistration, modelFromJson);
  });

  group('fromJson', () {
    test('shuold return a valid model', () async {
      final json = fixture(tFixture);
      final result = Registration.fromJson(json);
      expect(result, equals(tRegistration));
    });
  });

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = jsonDecode(tRegistration.toJson());
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
