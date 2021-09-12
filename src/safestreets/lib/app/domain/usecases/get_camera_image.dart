import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/domain/repositories/report_repository.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class GetCameraImage extends UseCaseFuture<Image, NoParams> {
  final ReportRepository reportRepository;

  GetCameraImage({
    @required this.reportRepository,
  });

  @override
  Future<Image> call(NoParams params) async =>
      await reportRepository.getCameraImage();
}
