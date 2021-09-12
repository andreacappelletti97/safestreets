import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/camera_data_source.dart';
import 'package:safestreets/app/data/datasources/report_remote_data_source.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/app/domain/repositories/report_repository.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/network/network_info.dart';
import 'package:safestreets/core/services/report_validation_service.dart';

const String REPORT_FIRESTORE_FAILURE_MESSAGE =
    'Posting Report to Firestore failed';

const String REPORT_INVALID_IMAGE_ERROR = "Image not valid";

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource reportRemoteDataSource;
  final CameraDataSource cameraDataSource;
  final NetworkInfo networkInfo;
  final ReportValidationService reportValidationService;

  const ReportRepositoryImpl({
    @required this.reportRemoteDataSource,
    @required this.cameraDataSource,
    @required this.networkInfo,
    @required this.reportValidationService,
  });

  @override
  Future<Image> getCameraImage() async =>
      await cameraDataSource.getImageFromCamera();

  @override
  Future<Either<Failure, String>> postReport(Report report) async {
    if (!(await networkInfo.isConnected)) {
      return Left(NoInternetConnectionFailure());
    }

    if (!reportValidationService(report)) {
      return Left(
        ValidationFailure(
          message: REPORT_INVALID_IMAGE_ERROR,
        ),
      );
    }

    try {
      final failOrPosted = await reportRemoteDataSource.postReport(report);
      return failOrPosted;
    } on FirestoreException {
      return Left(
        FirestoreFailure(
          message: REPORT_FIRESTORE_FAILURE_MESSAGE,
        ),
      );
    }
  }
}
