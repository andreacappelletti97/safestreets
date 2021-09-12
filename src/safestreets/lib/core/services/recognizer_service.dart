import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class RecognizerService {
  Future<Either<Failure, LicensePlate>> recognizeLicensePlateFromImage(
    Image image,
  );
}

class RecognizerFirebaseML implements RecognizerService {
  final FirebaseVision firebaseVision;

  const RecognizerFirebaseML({
    @required this.firebaseVision,
  });

  @override
  Future<Either<Failure, LicensePlate>> recognizeLicensePlateFromImage(
    Image image,
  ) async {
    try {
      final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(
        image.file,
      );
      final TextRecognizer textRecognizer = firebaseVision.textRecognizer();
      final VisionText visionText = await textRecognizer.processImage(
        visionImage,
      );
      textRecognizer.close();
      return Right(
        LicensePlate(
          (l) => l
            ..code = visionText.text
            ..licensePlateSource = LicensePlateSource.recognizer,
        ),
      );
    } catch (e) {
      return Left(
        FirebaseMLFailure(),
      );
    }
  }
}
