// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class UserState extends Equatable {
  const UserState(this._type);

  factory UserState.startUpUserState() = StartUpUserState;

  factory UserState.loadingUserState() = LoadingUserState;

  factory UserState.loggedUserState({@required User user}) = LoggedUserState;

  factory UserState.emptyUserState({@required String status}) = EmptyUserState;

  factory UserState.errorUserState({@required String message}) = ErrorUserState;

  final _UserState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(StartUpUserState) startUpUserState,
      @required R Function(LoadingUserState) loadingUserState,
      @required R Function(LoggedUserState) loggedUserState,
      @required R Function(EmptyUserState) emptyUserState,
      @required R Function(ErrorUserState) errorUserState}) {
    switch (this._type) {
      case _UserState.StartUpUserState:
        return startUpUserState(this as StartUpUserState);
      case _UserState.LoadingUserState:
        return loadingUserState(this as LoadingUserState);
      case _UserState.LoggedUserState:
        return loggedUserState(this as LoggedUserState);
      case _UserState.EmptyUserState:
        return emptyUserState(this as EmptyUserState);
      case _UserState.ErrorUserState:
        return errorUserState(this as ErrorUserState);
    }
  }

  @override
  List get props => null;
}

@immutable
class StartUpUserState extends UserState {
  const StartUpUserState._() : super(_UserState.StartUpUserState);

  factory StartUpUserState() {
    _instance ??= StartUpUserState._();
    return _instance;
  }

  static StartUpUserState _instance;
}

@immutable
class LoadingUserState extends UserState {
  const LoadingUserState._() : super(_UserState.LoadingUserState);

  factory LoadingUserState() {
    _instance ??= LoadingUserState._();
    return _instance;
  }

  static LoadingUserState _instance;
}

@immutable
class LoggedUserState extends UserState {
  const LoggedUserState({@required this.user})
      : super(_UserState.LoggedUserState);

  final User user;

  @override
  String toString() => 'LoggedUserState(user:${this.user})';
  @override
  List get props => [user];
}

@immutable
class EmptyUserState extends UserState {
  const EmptyUserState({@required this.status})
      : super(_UserState.EmptyUserState);

  final String status;

  @override
  String toString() => 'EmptyUserState(status:${this.status})';
  @override
  List get props => [status];
}

@immutable
class ErrorUserState extends UserState {
  const ErrorUserState({@required this.message})
      : super(_UserState.ErrorUserState);

  final String message;

  @override
  String toString() => 'ErrorUserState(message:${this.message})';
  @override
  List get props => [message];
}
