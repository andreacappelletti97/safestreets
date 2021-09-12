import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class RegistrationRepository {
  /// Calls [FirebaseAuth] to register the User to the application
  ///
  /// Return a [User] which represents the userID generate from Firebase
  ///
  /// In case of [Failure], two possible situations may happen:
  /// - [ValidationFailure] if input data not valid (with specific error message included)
  /// - [NoInternetConnectionFailure] in case not internet connection is available
  /// - [FirebaseRegistrationFailure] in case the registration process is not successful
  Future<Either<Failure, User>> postRegistration(Registration registration);
}
