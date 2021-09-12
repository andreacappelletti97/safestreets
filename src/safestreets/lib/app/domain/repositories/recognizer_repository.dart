import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class RecognizerRepository {
  /// Recognizes the [LicensePlate] from the [Image] of the violation
  Future<Either<Failure, LicensePlate>> recognizeLicensePlate(Image image);
}
