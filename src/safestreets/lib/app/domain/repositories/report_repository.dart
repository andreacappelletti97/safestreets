import 'package:dartz/dartz.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class ReportRepository {
  /// Post [Report] into Database
  ///
  /// Returns a [String], which is the json representation of
  /// the newly posted [Report] object (from toJson() call)
  Future<Either<Failure, String>> postReport(Report report);

  /// Gets the [Image] for the report
  /// 
  /// To display it from the [File] object use
  /// 
  /// ``
  /// Image.file(source)
  /// ``
  Future<Image> getCameraImage();
}
