// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class RequestEvent extends Equatable {
  const RequestEvent(this._type);

  factory RequestEvent.areaRequestEvent({@required int area}) =
      AreaRequestEvent;

  factory RequestEvent.areaViolationRequestEvent({@required int area}) =
      AreaViolationRequestEvent;

  factory RequestEvent.licensePlateRequestEvent(
      {@required String licensePlate}) = LicensePlateRequestEvent;

  factory RequestEvent.myReportRequestEvent() = MyReportRequestEvent;

  factory RequestEvent.restoreRequestEvent() = RestoreRequestEvent;

  factory RequestEvent.areaSelectedEvent({@required Area area}) =
      AreaSelectedEvent;

  final _RequestEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AreaRequestEvent) areaRequestEvent,
      @required R Function(AreaViolationRequestEvent) areaViolationRequestEvent,
      @required R Function(LicensePlateRequestEvent) licensePlateRequestEvent,
      @required R Function(MyReportRequestEvent) myReportRequestEvent,
      @required R Function(RestoreRequestEvent) restoreRequestEvent,
      @required R Function(AreaSelectedEvent) areaSelectedEvent}) {
    switch (this._type) {
      case _RequestEvent.AreaRequestEvent:
        return areaRequestEvent(this as AreaRequestEvent);
      case _RequestEvent.AreaViolationRequestEvent:
        return areaViolationRequestEvent(this as AreaViolationRequestEvent);
      case _RequestEvent.LicensePlateRequestEvent:
        return licensePlateRequestEvent(this as LicensePlateRequestEvent);
      case _RequestEvent.MyReportRequestEvent:
        return myReportRequestEvent(this as MyReportRequestEvent);
      case _RequestEvent.RestoreRequestEvent:
        return restoreRequestEvent(this as RestoreRequestEvent);
      case _RequestEvent.AreaSelectedEvent:
        return areaSelectedEvent(this as AreaSelectedEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class AreaRequestEvent extends RequestEvent {
  const AreaRequestEvent({@required this.area})
      : super(_RequestEvent.AreaRequestEvent);

  final int area;

  @override
  String toString() => 'AreaRequestEvent(area:${this.area})';
  @override
  List get props => [area];
}

@immutable
class AreaViolationRequestEvent extends RequestEvent {
  const AreaViolationRequestEvent({@required this.area})
      : super(_RequestEvent.AreaViolationRequestEvent);

  final int area;

  @override
  String toString() => 'AreaViolationRequestEvent(area:${this.area})';
  @override
  List get props => [area];
}

@immutable
class LicensePlateRequestEvent extends RequestEvent {
  const LicensePlateRequestEvent({@required this.licensePlate})
      : super(_RequestEvent.LicensePlateRequestEvent);

  final String licensePlate;

  @override
  String toString() =>
      'LicensePlateRequestEvent(licensePlate:${this.licensePlate})';
  @override
  List get props => [licensePlate];
}

@immutable
class MyReportRequestEvent extends RequestEvent {
  const MyReportRequestEvent._() : super(_RequestEvent.MyReportRequestEvent);

  factory MyReportRequestEvent() {
    _instance ??= MyReportRequestEvent._();
    return _instance;
  }

  static MyReportRequestEvent _instance;
}

@immutable
class RestoreRequestEvent extends RequestEvent {
  const RestoreRequestEvent._() : super(_RequestEvent.RestoreRequestEvent);

  factory RestoreRequestEvent() {
    _instance ??= RestoreRequestEvent._();
    return _instance;
  }

  static RestoreRequestEvent _instance;
}

@immutable
class AreaSelectedEvent extends RequestEvent {
  const AreaSelectedEvent({@required this.area})
      : super(_RequestEvent.AreaSelectedEvent);

  final Area area;

  @override
  String toString() => 'AreaSelectedEvent(area:${this.area})';
  @override
  List get props => [area];
}
