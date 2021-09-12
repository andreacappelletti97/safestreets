import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/profile_local_data_source.dart';
import 'package:safestreets/app/data/datasources/profile_remote_data_source.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:safestreets/core/error/failures.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource profileLocalDataSource;
  final ProfileRemoteDataSource profileRemoteDataSource;

  const ProfileRepositoryImpl({
    @required this.profileLocalDataSource,
    @required this.profileRemoteDataSource,
  });

  @override
  Either<Failure, User> getUser() => profileLocalDataSource.getLocalUser();

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userID =
          await profileRemoteDataSource.userAuthentication(email, password);
      return Right(
        userID,
      );
    } on FirebaseAuthException {
      return Left(
        FirebaseAuthFailure(
          message: 'Auth problem, try to sign in again',
        ),
      );
    } on FirebaseRegistrationException {
      return Left(
        FirebaseRegistrationFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await profileRemoteDataSource.userLogout();
      await profileLocalDataSource.removeLocalUser();
      return Right(true);
    } catch (e) {
      return Left(
        FirebaseAuthFailure(message: 'Error on sign out,'),
      );
    }
  }

  @override
  Future<void> saveUser(User user) =>
      profileLocalDataSource.storeLocalUser(user);
}
