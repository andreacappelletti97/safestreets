import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/location_data_source.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/app/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource locationDataSource;

  const LocationRepositoryImpl({
    @required this.locationDataSource,
  });

  @override
  Future<Location> getCurrentLocation() async =>
      await locationDataSource.getGPSLocation();
}
