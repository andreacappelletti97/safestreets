import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'license_plate_source.g.dart';

class LicensePlateSource extends EnumClass {
  static const LicensePlateSource user = _$user;
  static const LicensePlateSource recognizer = _$recognizer;

  const LicensePlateSource._(String name) : super(name);

  static BuiltSet<LicensePlateSource> get values => _$values;
  static LicensePlateSource valueOf(String name) => _$valueOf(name);
  static Serializer<LicensePlateSource> get serializer =>
      _$licensePlateSourceSerializer;
}
