import 'package:flutter_test/flutter_test.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/core/services/registration_validation_service.dart';

void main() {
  RegistrationValidationService service;

  setUp(() {
    service = RegistrationValidationService();
  });

  group('call', () {
    final tRegistrationValid = Registration(
      (r) => r
        ..email = 'email@mail.it'
        ..name = 'name'
        ..surname = 'surname'
        ..password = 'PasswordMAIUSC123',
    );

    final tRegistrationInvalid = Registration(
      (r) => r
        ..email = 'email'
        ..name = 'name'
        ..surname = 'surname'
        ..password = '123',
    );

    test('should return true when Registration is valid', () async {
      final result = service(tRegistrationValid);
      expect(result, true);
    });

    test('should return false when Registration is invalid', () async {
      final result = service(tRegistrationInvalid);
      expect(result, false);
    });
  });
}
