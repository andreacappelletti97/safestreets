// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class NotificationEvent extends Equatable {
  const NotificationEvent(this._type);

  factory NotificationEvent.initalizeNotificationEvent() =
      InitalizeNotificationEvent;

  factory NotificationEvent.updateNotificationEvent(
      {@required int indexChange,
      @required bool newValue}) = UpdateNotificationEvent;

  final _NotificationEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(InitalizeNotificationEvent) initalizeNotificationEvent,
      @required
          R Function(UpdateNotificationEvent) updateNotificationEvent}) {
    switch (this._type) {
      case _NotificationEvent.InitalizeNotificationEvent:
        return initalizeNotificationEvent(this as InitalizeNotificationEvent);
      case _NotificationEvent.UpdateNotificationEvent:
        return updateNotificationEvent(this as UpdateNotificationEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class InitalizeNotificationEvent extends NotificationEvent {
  const InitalizeNotificationEvent._()
      : super(_NotificationEvent.InitalizeNotificationEvent);

  factory InitalizeNotificationEvent() {
    _instance ??= InitalizeNotificationEvent._();
    return _instance;
  }

  static InitalizeNotificationEvent _instance;
}

@immutable
class UpdateNotificationEvent extends NotificationEvent {
  const UpdateNotificationEvent(
      {@required this.indexChange, @required this.newValue})
      : super(_NotificationEvent.UpdateNotificationEvent);

  final int indexChange;

  final bool newValue;

  @override
  String toString() =>
      'UpdateNotificationEvent(indexChange:${this.indexChange},newValue:${this.newValue})';
  @override
  List get props => [indexChange, newValue];
}
