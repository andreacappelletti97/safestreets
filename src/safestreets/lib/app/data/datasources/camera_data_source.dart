import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:safestreets/app/data/models/image.dart';

abstract class CameraDataSource {
  /// Opens the camera to take a picture
  /// and returns a [Image] object, which contains
  /// the [File] of the image itself
  Future<Image> getImageFromCamera();

  /// Opens the gallery to select a picture
  /// and returns a [Image] object, which contains
  /// the [File] of the image itself
  Future<Image> getImageFromGallery();
}

class CameraImagePickerImpl implements CameraDataSource {
  @override
  Future<Image> getImageFromCamera() async => await _getImage(
        ImageSource.camera,
      );

  @override
  Future<Image> getImageFromGallery() async => await _getImage(
        ImageSource.gallery,
      );

  Future<Image> _getImage(ImageSource source) async {
    final file = await ImagePicker.pickImage(
      source: source,
    );
    final image = _getImageFromFile(file);
    return image;
  }

  Future<Image> _getImageFromFile(File file) async => Image(
        (i) => i
          ..file = file
          ..name = file.path,
      );
}
