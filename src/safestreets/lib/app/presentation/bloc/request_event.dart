import 'package:safestreets/app/data/models/area.dart';
import 'package:super_enum/super_enum.dart';

part 'request_event.g.dart';

@superEnum
enum _RequestEvent {
  @Data(fields: [
    DataField("area", int),
  ])
  AreaRequestEvent,

  @Data(fields: [
    DataField("area", int),
  ])
  AreaViolationRequestEvent,

  @Data(fields: [
    DataField("licensePlate", String),
  ])
  LicensePlateRequestEvent,

  @object
  MyReportRequestEvent,

  @object
  RestoreRequestEvent,

  @Data(fields: [
    DataField("area", Area),
  ])
  AreaSelectedEvent,
}
