import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/datasources/notification_local_data_source.dart';
import 'package:safestreets/app/data/datasources/notification_remote_data_source.dart';
import 'package:safestreets/app/domain/repositories/notification_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:safestreets/core/network/network_info.dart';

const String NOTIFICATION_FIRESTORE_FAILURE_MESSAGE =
    'Subscribing Notification on Firestore failed';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource notificationRemoteDataSource;
  final NotificationLocalDataSource notificationLocalDataSource;
  final NetworkInfo networkInfo;

  const NotificationRepositoryImpl({
    @required this.notificationRemoteDataSource,
    @required this.notificationLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> subscribeAreaNotification(String areaID) async {
    return await _subscribe(() async {
      await notificationRemoteDataSource.subscribeToArea(areaID);
      await notificationLocalDataSource.subscribeLocalArea(areaID);
    });
  }

  @override
  Future<Either<Failure, void>> unsubscribeAreaNotification(
    String areaID,
  ) async {
    return await _subscribe(() async {
      await notificationRemoteDataSource.unsubscribeToArea(areaID);
      await notificationLocalDataSource.unsubscribeLocalArea(areaID);
    });
  }

  Future<Either<Failure, void>> _subscribe(
    Future<void> Function() function,
  ) async {
    if (!(await networkInfo.isConnected)) {
      return Left(NoInternetConnectionFailure());
    }

    try {
      await function();
      return Right(true);
    } on FirestoreException {
      return Left(
        FirestoreFailure(
          message: NOTIFICATION_FIRESTORE_FAILURE_MESSAGE,
        ),
      );
    }
  }

  @override
  Future<bool> getSubscriptionArea(String areaID) async =>
      await notificationLocalDataSource.getAreaStatus(areaID);
}
