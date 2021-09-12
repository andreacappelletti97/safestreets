import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/image.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tFixture = 'image.json';
  final tImage = Image(
    (i) => i
      ..file = File('file')
      ..name = 'file',
  );

  group('toJson', () {
    test('should return a valid JSON List', () {
      final jsonModel = jsonDecode(tImage.toJson());
      final jsonMap = jsonDecode(fixture(tFixture));
      expect(jsonMap, jsonModel);
    });
  });
}
