import 'package:safestreets/app/data/models/report.dart';
import 'package:super_enum/super_enum.dart';

part 'report_state.g.dart';

@superEnum
enum _ReportState {
  @object
  InitalReportState,
  @object
  TakingImageReportState,
  @object
  RecognizingReportState,
  @object
  GettingLocationReportState,
  @Data(fields: [
    DataField('report', Report),
  ])
  NoLicensePlateReportState,
  @Data(fields: [
    DataField('report', Report),
  ])
  WithLicensePlateReportState,
  @object
  PostingReportState,
  @Data(fields: [
    DataField('message', String),
  ])
  ErrorReportState,
  @Data(fields: [
    DataField('reportID', String),
  ])
  CompleteReportState,
}
