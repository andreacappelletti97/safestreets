import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/app/domain/repositories/report_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class PostReport extends UseCase<String, Params> {
  final ReportRepository reportRepository;

  PostReport({
    @required this.reportRepository,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await reportRepository.postReport(params.report);
  }
}

class Params extends Equatable {
  final Report report;

  const Params({
    @required this.report,
  });

  @override
  List<Object> get props => [report];
}
