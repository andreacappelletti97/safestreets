import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class NotificationRepository {
  /// Activate notification service for a specific [Area]
  ///
  /// Only available for Authorities!
  Future<Either<Failure, void>> subscribeAreaNotification(String areaID);

  /// Deactivate notification service for a specific [Area]
  ///
  /// Only available for Authorities!
  Future<Either<Failure, void>> unsubscribeAreaNotification(String areaID);

  /// Retrieve current activation status for a specific [Area]
  ///
  /// Only available for Authorities!
  Future<bool> getSubscriptionArea(String areaID);
}
