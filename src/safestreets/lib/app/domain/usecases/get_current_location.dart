import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/app/domain/repositories/location_repository.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class GetCurrentLocation extends UseCaseFuture<Location, NoParams> {
  final LocationRepository locationRepository;

  GetCurrentLocation({
    @required this.locationRepository,
  });

  @override
  Future<Location> call(NoParams params) async =>
      await locationRepository.getCurrentLocation();
}
