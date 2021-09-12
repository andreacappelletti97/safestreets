// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent(this._type);

  factory UserEvent.getLocalUserEvent() = GetLocalUserEvent;

  factory UserEvent.signInUserEvent(
      {@required String email, @required String password}) = SignInUserEvent;

  factory UserEvent.signUpUserEvent(
      {@required String name,
      @required String surname,
      @required String email,
      @required String password}) = SignUpUserEvent;

  factory UserEvent.signOutUserEvent() = SignOutUserEvent;

  final _UserEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(GetLocalUserEvent) getLocalUserEvent,
      @required R Function(SignInUserEvent) signInUserEvent,
      @required R Function(SignUpUserEvent) signUpUserEvent,
      @required R Function(SignOutUserEvent) signOutUserEvent}) {
    switch (this._type) {
      case _UserEvent.GetLocalUserEvent:
        return getLocalUserEvent(this as GetLocalUserEvent);
      case _UserEvent.SignInUserEvent:
        return signInUserEvent(this as SignInUserEvent);
      case _UserEvent.SignUpUserEvent:
        return signUpUserEvent(this as SignUpUserEvent);
      case _UserEvent.SignOutUserEvent:
        return signOutUserEvent(this as SignOutUserEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class GetLocalUserEvent extends UserEvent {
  const GetLocalUserEvent._() : super(_UserEvent.GetLocalUserEvent);

  factory GetLocalUserEvent() {
    _instance ??= GetLocalUserEvent._();
    return _instance;
  }

  static GetLocalUserEvent _instance;
}

@immutable
class SignInUserEvent extends UserEvent {
  const SignInUserEvent({@required this.email, @required this.password})
      : super(_UserEvent.SignInUserEvent);

  final String email;

  final String password;

  @override
  String toString() =>
      'SignInUserEvent(email:${this.email},password:${this.password})';
  @override
  List get props => [email, password];
}

@immutable
class SignUpUserEvent extends UserEvent {
  const SignUpUserEvent(
      {@required this.name,
      @required this.surname,
      @required this.email,
      @required this.password})
      : super(_UserEvent.SignUpUserEvent);

  final String name;

  final String surname;

  final String email;

  final String password;

  @override
  String toString() =>
      'SignUpUserEvent(name:${this.name},surname:${this.surname},email:${this.email},password:${this.password})';
  @override
  List get props => [name, surname, email, password];
}

@immutable
class SignOutUserEvent extends UserEvent {
  const SignOutUserEvent._() : super(_UserEvent.SignOutUserEvent);

  factory SignOutUserEvent() {
    _instance ??= SignOutUserEvent._();
    return _instance;
  }

  static SignOutUserEvent _instance;
}
