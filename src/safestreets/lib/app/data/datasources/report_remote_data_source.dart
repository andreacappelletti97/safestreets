import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/notification_local_data_source.dart';
import 'package:safestreets/app/data/datasources/notification_remote_data_source.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/services/storage_service.dart';

// Reference to names of collection db firestore
const String FIRESTORE_REPORT_COLLECTION = 'report';
const String AREA_REPORT_COLLECTION = 'area';

abstract class ReportRemoteDataSource {
  /// Store created report to the remote database
  Future<Either<Failure, String>> postReport(Report report);
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final Firestore firestore;
  final StorageService storageService;

  const ReportRemoteDataSourceImpl({
    @required this.firestore,
    @required this.storageService,
  });

  @override
  Future<Either<Failure, String>> postReport(Report report) async {
    try {
      // 1. Store image (Firebase Storage)
      final sentImage = await storageService.postStoreImage(
        report.image,
        report.userID,
      );

      final reportMap = report
          .rebuild(
            (r) => r..image.name = sentImage.name,
          )
          .toJsonMap();

      // 2. Store report inside 'report' collection
      final doc = await firestore
          .collection(
            FIRESTORE_REPORT_COLLECTION,
          )
          .add(
            reportMap,
          );
      final reportID = doc.documentID;

      // 3. Store new area inside 'area' collection (for notification cloud function)
      final randArea = Random().nextInt(3);
      await firestore.collection(FIRESTORE_AREA_COLLECTION).add(
        {
          'name': randArea == 0
              ? AREA_1_SHARED_PREF
              : randArea == 1 ? AREA_2_SHARED_PREF : AREA_3_SHARED_PREF,
          'location': '${report.location}',
        },
      );

      return Right(reportID);
    } catch (e) {
      return Left(
        PostingReportFailure(),
      );
    }
  }
}
