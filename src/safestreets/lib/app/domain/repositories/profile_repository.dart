import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class ProfileRepository {
  /// Sign out the User
  Future<Either<Failure, void>> logout();

  /// Sign in the User given email and password
  ///
  /// It returns the User ID [User]
  Future<Either<Failure, User>> login(
    String email,
    String password,
  );

  /// Retrieve the User ID, saved from the previous login
  Either<Failure, User> getUser();

  /// Store locally the User ID after the login
  Future<void> saveUser(User userID);
}
