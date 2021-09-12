import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safestreets/app/data/models/location.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'location.json';
  final tLocation = Location(
    (l) => l
      ..position = Position(
        latitude: 0,
        longitude: 0,
      ),
  );

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = jsonDecode(tLocation.toJson());
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
