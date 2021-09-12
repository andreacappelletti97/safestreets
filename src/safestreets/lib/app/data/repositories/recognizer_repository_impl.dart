import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/domain/repositories/recognizer_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/services/recognizer_service.dart';

class RecognizerRepositoryImpl implements RecognizerRepository {
  final RecognizerService recognizerService;

  const RecognizerRepositoryImpl({
    @required this.recognizerService,
  });

  @override
  Future<Either<Failure, LicensePlate>> recognizeLicensePlate(Image image) =>
      recognizerService.recognizeLicensePlateFromImage(image);
}
