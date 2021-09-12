import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:safestreets/app/data/models/image.dart';

const String STORAGE_PATH = 'violations';

abstract class StorageService {
  Future<Image> postStoreImage(Image image, String uid);
}

class StorageServiceImpl implements StorageService {
  @override
  Future<Image> postStoreImage(Image image, String uid) async {
    try {
      final Uint8List dataBytes = image.file.readAsBytesSync();
      final date = DateTime.now();
      final imageName =
          '$uid-${date.day}_${date.month}_${date.year}_${date.hour}_${date.minute}_${date.second}_${date.millisecond}';
      final StorageUploadTask uploadTask = FirebaseStorage()
          .ref()
          .child(
            '$STORAGE_PATH/$imageName',
          )
          .putData(
            dataBytes,
          );

      final StreamSubscription<StorageTaskEvent> streamSubscription =
          uploadTask.events.listen((event) {
        print('EVENT ${event.type}');
      });

      await uploadTask.onComplete;
      streamSubscription.cancel();
      return image.rebuild(
        (i) => i..name = imageName,
      );
    } catch (e) {
      throw e;
    }
  }
}
