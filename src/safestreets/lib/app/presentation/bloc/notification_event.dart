import 'package:super_enum/super_enum.dart';

part 'notification_event.g.dart';

@superEnum
enum _NotificationEvent {
  @object
  InitalizeNotificationEvent,
  @Data(fields: [
    DataField('indexChange', int),
    DataField('newValue', bool),
  ])
  UpdateNotificationEvent,
}
