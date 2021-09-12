import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String SHARED_PREFERENCES_USER_ID = 'userID';

abstract class ProfileLocalDataSource {
  /// Remove local [User] userId reference
  Future<void> removeLocalUser();

  /// Store local [User] userId reference
  Future<void> storeLocalUser(User userID);

  /// Retrieve local [User] userId reference
  Either<Failure, User> getLocalUser();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  const ProfileLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Either<Failure, User> getLocalUser() {
    final userJson = sharedPreferences.getString(
      SHARED_PREFERENCES_USER_ID,
    );

    if (userJson == null) {
      return Left(LocalUserMissing());
    } else {
      return Right(User.fromJson(userJson));
    }
  }

  @override
  Future<void> storeLocalUser(User user) async =>
      await sharedPreferences.setString(
        SHARED_PREFERENCES_USER_ID,
        user.toJson(),
      );

  @override
  Future<void> removeLocalUser() async => await sharedPreferences.remove(
        SHARED_PREFERENCES_USER_ID,
      );
}
