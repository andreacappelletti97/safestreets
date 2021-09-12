import 'package:super_enum/super_enum.dart';

part 'user_event.g.dart';

@superEnum
enum _UserEvent {
  @object
  GetLocalUserEvent,
  @Data(fields: [
    DataField('email', String),
    DataField('password', String),
  ])
  SignInUserEvent,
  @Data(fields: [
    DataField('name', String),
    DataField('surname', String),
    DataField('email', String),
    DataField('password', String),
  ])
  SignUpUserEvent,
  @object
  SignOutUserEvent,
}
