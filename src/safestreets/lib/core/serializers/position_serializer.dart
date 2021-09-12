import 'package:built_value/serializer.dart';
import 'package:geolocator/geolocator.dart';

class PositionSerializer implements PrimitiveSerializer<Position> {
  @override
  Position deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      serialized;

  @override
  Object serialize(Serializers serializers, Position object,
          {FullType specifiedType = FullType.unspecified}) =>
      object;

  @override
  Iterable<Type> get types => [Position];

  @override
  String get wireName => 'Position';
}
