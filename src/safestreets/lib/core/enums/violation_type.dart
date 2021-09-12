import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'violation_type.g.dart';

class ViolationType extends EnumClass {
  static const ViolationType generic = _$generic;
  static const ViolationType parking = _$parking;
  static const ViolationType noAuth = _$noAuth;
  static const ViolationType noPay = _$noPay;

  const ViolationType._(String name) : super(name);

  static BuiltSet<ViolationType> get values => _$values;
  static ViolationType valueOf(String name) => _$valueOf(name);
  static Serializer<ViolationType> get serializer => _$violationTypeSerializer;
}
