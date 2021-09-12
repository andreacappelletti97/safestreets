import 'package:safestreets/app/data/models/location.dart';

abstract class LocationRepository {
  /// Retrieve current [Location] from GPS of the device
  /// 
  /// The [Location] object contains all the necessary informations,
  /// in particular latitude and longitude
  Future<Location> getCurrentLocation();
}
