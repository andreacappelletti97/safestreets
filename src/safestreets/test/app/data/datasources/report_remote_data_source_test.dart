import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:safestreets/app/data/datasources/report_remote_data_source.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/enums/violation_type.dart';
import 'package:safestreets/core/services/storage_service.dart';

class MockFirestore extends Mock implements Firestore {}

class MockStorageService extends Mock implements StorageService {}

void main() {
  MockFirestore mockFirestore;
  MockStorageService mockStorageService;
  ReportRemoteDataSource dataSource;

  setUp(() {
    mockFirestore = MockFirestore();
    mockStorageService = MockStorageService();
    dataSource = ReportRemoteDataSourceImpl(
      firestore: mockFirestore,
      storageService: mockStorageService,
    );
  });

  group('postReport', () {
    final tReport = Report(
      (r) => r
        ..userID = 'abc'
        ..violationType = ViolationType.generic
        ..image = Image(
          (i) => i
            ..file = File('file')
            ..name = 'file',
        ).toBuilder()
        ..licensePlate = LicensePlate(
          (l) => l
            ..code = 'abc'
            ..licensePlateSource = LicensePlateSource.recognizer,
        ).toBuilder()
        ..location = Location(
          (l) => l
            ..position = Position(
              latitude: 0,
              longitude: 0,
            ),
        ).toBuilder(),
    );

    test('should perform a POST request and return the correct image',
        () async {
      when(mockStorageService.postStoreImage(any, any)).thenAnswer(
        (_) async => Image(
          (i) => i
            ..name = 'file'
            ..file = File('file'),
        ),
      );

      dataSource.postReport(tReport);

      verify(
        mockStorageService.postStoreImage(
          tReport.image,
          tReport.userID,
        ),
      );
    });
  });
}
