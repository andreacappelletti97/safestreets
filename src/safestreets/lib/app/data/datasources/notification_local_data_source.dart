import 'package:meta/meta.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Area topics for notifications
const String AREA_1_SHARED_PREF = 'area1';
const String AREA_2_SHARED_PREF = 'area2';
const String AREA_3_SHARED_PREF = 'area3';

abstract class NotificationLocalDataSource {
  /// Activate notification for a specific [Area]
  ///
  /// Only for autorities!
  Future<bool> subscribeLocalArea(String areaID);

  /// Dectivate notification for a specific [Area]
  ///
  /// Only for autorities!
  Future<bool> unsubscribeLocalArea(String areaID);

  /// Retrieve current activation status of a specific [Area]
  Future<bool> getAreaStatus(String areaID);
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final SharedPreferences sharedPreferences;

  const NotificationLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<bool> subscribeLocalArea(String areaID) async {
    try {
      return await _subscribe(areaID, true);
    } catch (e) {
      throw NotificationException();
    }
  }

  @override
  Future<bool> unsubscribeLocalArea(String areaID) async {
    try {
      return await _subscribe(areaID, false);
    } catch (e) {
      throw NotificationException();
    }
  }

  Future<bool> _subscribe(String key, bool value) async =>
      await sharedPreferences.setBool(
        key,
        value,
      );

  @override
  Future<bool> getAreaStatus(String areaID) => Future.value(
        sharedPreferences.getBool(areaID) ?? false,
      );
}
