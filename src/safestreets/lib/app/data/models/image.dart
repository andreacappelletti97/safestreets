import 'dart:convert';
import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:safestreets/core/serializers/serializers.dart';

part 'image.g.dart';

abstract class Image implements Built<Image, ImageBuilder> {
  File get file;
  String get name;

  Image._();

  factory Image([void Function(ImageBuilder) updates]) = _$Image;

  String toJson() {
    return json.encode(serializers.serializeWith(Image.serializer, this));
  }

  static Serializer<Image> get serializer => _$imageSerializer;
}
