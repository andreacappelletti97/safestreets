import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/core/enums/safety.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'area.json';
  final tArea = Area(
    areaID: 1,
    numberOfViolations: 1,
    safety: Safety.high,
  );

  test(
      'should be able to convert fromJson and then toJson with the initial model as result',
      () async {
    final json = jsonDecode((fixture(tFixture)));
    final modelFromJson = Area.fromJson(json);
    final jsonFromModel = modelFromJson.toJson();
    expect(json, jsonFromModel);
  });

  test(
      'should be able to convert toJson and then fromJson with the initial model as result',
      () async {
    final jsonFromModel = tArea.toJson();
    final modelFromJson = Area.fromJson(jsonFromModel);
    expect(tArea, modelFromJson);
  });

  group('fromJson', () {
    test('shuold return a valid model', () async {
      final json = jsonDecode((fixture(tFixture)));
      final result = Area.fromJson(json);
      expect(result, equals(tArea));
    });
  });

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = tArea.toJson();
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
