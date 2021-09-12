import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/location.dart';

abstract class LocationDataSource {
  /// Get [Location] from device's GPS system,
  /// containing latitude and longitude coordinates
  Future<Location> getGPSLocation();
}

class LocationGeolocatorImpl implements LocationDataSource {
  final Geolocator geolocator;

  const LocationGeolocatorImpl({
    @required this.geolocator,
  });

  @override
  Future<Location> getGPSLocation() async {
    Position position = await geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return Location(
      (l) => l..position = position,
    );
  }
}
