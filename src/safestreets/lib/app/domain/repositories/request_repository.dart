import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/app/data/models/violation.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class RequestRepository {
  /// Retrieve a [List] of [Area],
  /// containing information about the [Safety] and the number of violations
  Future<Either<Failure, Area>> getAreaRequest(String userID, int area);

  /// Retrieve a [List] of [Violation],
  /// matching all the violations inside the [Area] parameter
  ///
  /// Only available for Authorities!
  Future<Either<Failure, List<Request>>> getAreaViolationRequest(
    int area,
    String userID,
  );

  /// Retrieve a [List] of [Violation],
  /// matching all the violations related to the [LicensePlate] parameter
  ///
  /// Only available for Authorities!
  Future<Either<Failure, List<Request>>> getLicensePlateRequest(
    String licensePlate,
    String userID,
  );

  /// Retrieve a [List] of [Violation],
  /// matching all the violations related the User who sends the request
  /// based on the [String] user id parameter
  Future<Either<Failure, List<Request>>> getMyReport(String userID);
}
