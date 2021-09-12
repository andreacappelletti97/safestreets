import 'package:safestreets/app/data/models/user.dart';
import 'package:super_enum/super_enum.dart';

part 'user_state.g.dart';

@superEnum
enum _UserState {
  @object
  StartUpUserState,
  @object
  LoadingUserState,
  @Data(fields: [
    DataField('user', User),
  ])
  LoggedUserState,
  @Data(fields: [
    DataField('status', String),
  ])
  EmptyUserState,
  @Data(fields: [
    DataField('message', String),
  ])
  ErrorUserState,
}
