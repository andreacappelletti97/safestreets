import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/core/services/validator.dart';

class RegistrationValidationService implements Validator<Registration> {
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  _isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  _isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  @override
  bool call(Registration object) =>
      _isValidEmail(object.email) && _isValidPassword(object.password);
}
