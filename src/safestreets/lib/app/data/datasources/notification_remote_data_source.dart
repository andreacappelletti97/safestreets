import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/core/error/exceptions.dart';

// Name of the Firestore collection on which the app listen  for new violations
const String FIRESTORE_AREA_COLLECTION = 'area';

abstract class NotificationRemoteDataSource {
  /// Subscribe to remote notification service for
  /// violation updates inside a specific [Area]
  Future<void> subscribeToArea(String areaID);

  /// Unsubscribe from remote notification service for
  /// violation updates inside a specific [Area]
  Future<void> unsubscribeToArea(String areaID);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final FirebaseMessaging firebaseMessaging;

  const NotificationRemoteDataSourceImpl({
    @required this.firebaseMessaging,
  });

  @override
  Future<void> subscribeToArea(String areaID) async {
    try {
      return await firebaseMessaging.subscribeToTopic(areaID);
    } catch (e) {
      throw FirestoreException();
    }
  }

  @override
  Future<void> unsubscribeToArea(String areaID) async {
    try {
      return await firebaseMessaging.unsubscribeFromTopic(areaID);
    } catch (e) {
      throw FirestoreException();
    }
  }
}
