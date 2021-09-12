import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/domain/repositories/recognizer_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class RecognizeLicensePlate extends UseCase<LicensePlate, Params> {
  final RecognizerRepository recognizerRepository;

  RecognizeLicensePlate({
    @required this.recognizerRepository,
  });

  @override
  Future<Either<Failure, LicensePlate>> call(Params params) async =>
      await recognizerRepository.recognizeLicensePlate(params.image);
}

class Params extends Equatable {
  final Image image;

  const Params({
    @required this.image,
  });

  @override
  List<Object> get props => [image];
}
