import 'package:super_enum/super_enum.dart';

part 'report_event.g.dart';

@superEnum
enum _ReportEvent {
  @object
  TakeImageReportEvent,
  @object
  GetLocationReportEvent,
  @object
  RecognizeReportEvent,
  @Data(fields: [
    DataField('code', String),
    DataField('type', int),
  ])
  PostReportEvent,
}
