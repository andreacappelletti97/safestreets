import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/core/services/validator.dart';

class ReportValidationService implements Validator<Report> {
  @override
  bool call(Report object) =>
      object.userID != "" &&
      object.licensePlate.code != "" &&
      object.location.position != null &&
      object.image != null &&
      object.violationType != null;
}
