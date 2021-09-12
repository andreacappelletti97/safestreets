import 'dart:io';

import 'package:built_value/serializer.dart';

class FileSerializer implements PrimitiveSerializer<File> {
  @override
  File deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      serialized;

  @override
  Object serialize(Serializers serializers, File object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.uri.path;

  @override
  Iterable<Type> get types => [File];

  @override
  String get wireName => 'File';
}
