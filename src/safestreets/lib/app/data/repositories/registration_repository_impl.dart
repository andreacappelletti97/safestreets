import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/registration_remote_data_source.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/repositories/registration_repository.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/network/network_info.dart';
import 'package:safestreets/core/services/registration_validation_service.dart';

const String REGISTRATION_INVALID_EMAIL_ERROR = "Email not valid";
const String REGISTRATION_INVALID_PASSWORD_ERROR = "Password not valid";

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationRemoteDataSource registrationRemoteDataSource;
  final RegistrationValidationService registrationValidationService;
  final NetworkInfo networkInfo;

  const RegistrationRepositoryImpl({
    @required this.registrationRemoteDataSource,
    @required this.networkInfo,
    @required this.registrationValidationService,
  });

  @override
  Future<Either<Failure, User>> postRegistration(
      Registration registration) async {
    if (!(await networkInfo.isConnected)) {
      return Left(NoInternetConnectionFailure());
    }

    if (!registrationValidationService(registration)) {
      return Left(
        ValidationFailure(
          message: REGISTRATION_INVALID_EMAIL_ERROR,
        ),
      );
    }

    try {
      final userID =
          await registrationRemoteDataSource.postRegistration(registration);
      return Right(userID);
    } on FirebaseRegistrationException {
      return Left(
        FirebaseRegistrationFailure(),
      );
    } on FirebaseAuthException {
      return Left(
        FirebaseAuthFailure(
          message: 'Impossible to sign in, try again',
        ),
      );
    }
  }
}
