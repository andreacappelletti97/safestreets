import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/location.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/data/models/violation.dart';
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/enums/violation_type.dart';
import 'package:safestreets/core/serializers/file_serializer.dart';
import 'package:safestreets/core/serializers/position_serializer.dart';

part 'serializers.g.dart';

/// Collection of generated serializers
@SerializersFor([
  Violation,
  Report,
  ViolationType,
  Image,
  LicensePlate,
  Location,
  User,
  Request,
  LicensePlateSource,
  Registration,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(PositionSerializer())
      ..add(FileSerializer())
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
