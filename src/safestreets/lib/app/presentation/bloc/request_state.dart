import 'package:safestreets/app/data/models/area.dart';
import 'package:super_enum/super_enum.dart';

part 'request_state.g.dart';

@superEnum
enum _RequestState {
  @object
  StartUpRequestState,
  @object
  WaitingRequestState,
  @object
  SelectAreaRequestState,

  @Data(fields: [
    DataField("area", Area),
  ])
  AreaListReceived,

  @Data(fields: [
    DataField("area", Area),
  ])
  AreaRequestReceived,

  @Data(fields: [
    DataField("reportList", List),
  ])
  AreaViolationReceived,

  @Data(fields: [
    DataField("reportList", List),
  ])
  LicensePlateViolationReceived,

  @Data(fields: [
    DataField("reportList", List),
  ])
  MyReportReceived,

  @object
  ErrorRequestState
}
