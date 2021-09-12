import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:safestreets/app/data/datasources/request_remote_data_source.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/app/domain/repositories/request_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/network/network_info.dart';

const String REQUEST_FIRESTORE_FAILURE_MESSAGE =
    'Getting Request from Firestore failed';

class RequestRepositoryImpl implements RequestRepository {
  final RequestRemoteDataSource requestRemoteDataSource;
  final NetworkInfo networkInfo;

  const RequestRepositoryImpl({
    @required this.networkInfo,
    @required this.requestRemoteDataSource,
  });

  @override
  Future<Either<Failure, Area>> getAreaRequest(String userID, int area) async {
    if (!(await networkInfo.isConnected)) {
      return Left(NoInternetConnectionFailure());
    }

    try {
      final result = await requestRemoteDataSource.getAreaRemote(
        userID,
        area,
      );
      return Right(result);
    } on FirestoreException {
      return Left(
        FirestoreFailure(
          message: REQUEST_FIRESTORE_FAILURE_MESSAGE,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Request>>> getAreaViolationRequest(
          int area, String userID) =>
      _request<Request>(
        () async => await requestRemoteDataSource.getViolationInAreaRemote(
          area,
          userID,
        ),
      );

  @override
  Future<Either<Failure, List<Request>>> getLicensePlateRequest(
          String licensePlate, String userID) =>
      _request<Request>(
        () async =>
            await requestRemoteDataSource.getViolationFromLicensePlateRemote(
          licensePlate,
          userID,
        ),
      );

  @override
  Future<Either<Failure, List<Request>>> getMyReport(String userID) =>
      _request<Request>(
        () async => await requestRemoteDataSource.getMyReportRemote(
          userID,
        ),
      );

  Future<Either<Failure, List<T>>> _request<T>(
    Future<List<T>> Function() function,
  ) async {
    if (!(await networkInfo.isConnected)) {
      return Left(NoInternetConnectionFailure());
    }

    try {
      final result = await function();
      return Right(result);
    } on FirestoreException {
      return Left(
        FirestoreFailure(
          message: REQUEST_FIRESTORE_FAILURE_MESSAGE,
        ),
      );
    }
  }
}
