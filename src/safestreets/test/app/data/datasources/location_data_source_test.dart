import 'package:geolocator/geolocator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:safestreets/app/data/datasources/location_data_source.dart';
import 'package:safestreets/app/data/models/location.dart';

class MockGeolocator extends Mock implements Geolocator {}

void main() {
  MockGeolocator mockGeolocator;
  LocationDataSource dataSource;

  setUp(() {
    mockGeolocator = MockGeolocator();
    dataSource = LocationGeolocatorImpl(
      geolocator: mockGeolocator,
    );
  });

  group('getGPSLocation', () {
    final tPosition = Position(
      latitude: 0,
      longitude: 0,
    );

    final tLocation = Location(
      (l) => l..position = tPosition,
    );

    test('should call the GPS service to get the current position', () async {
      when(mockGeolocator.getCurrentPosition(
        desiredAccuracy: anyNamed('desiredAccuracy'),
      )).thenAnswer(
        (_) async => tPosition,
      );

      await dataSource.getGPSLocation();
      verify(mockGeolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ));
    });

    test('should return correct location when requested', () async {
      when(mockGeolocator.getCurrentPosition(
        desiredAccuracy: anyNamed('desiredAccuracy'),
      )).thenAnswer(
        (_) async => tPosition,
      );

      final result = await dataSource.getGPSLocation();
      expect(result, tLocation);
    });
  });
}
