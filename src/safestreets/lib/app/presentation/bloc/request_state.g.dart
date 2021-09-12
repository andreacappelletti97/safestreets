// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class RequestState extends Equatable {
  const RequestState(this._type);

  factory RequestState.startUpRequestState() = StartUpRequestState;

  factory RequestState.waitingRequestState() = WaitingRequestState;

  factory RequestState.selectAreaRequestState() = SelectAreaRequestState;

  factory RequestState.areaListReceived({@required Area area}) =
      AreaListReceived;

  factory RequestState.areaRequestReceived({@required Area area}) =
      AreaRequestReceived;

  factory RequestState.areaViolationReceived(
      {@required List<dynamic> reportList}) = AreaViolationReceived;

  factory RequestState.licensePlateViolationReceived(
      {@required List<dynamic> reportList}) = LicensePlateViolationReceived;

  factory RequestState.myReportReceived({@required List<dynamic> reportList}) =
      MyReportReceived;

  factory RequestState.errorRequestState() = ErrorRequestState;

  final _RequestState _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(StartUpRequestState) startUpRequestState,
      @required
          R Function(WaitingRequestState) waitingRequestState,
      @required
          R Function(SelectAreaRequestState) selectAreaRequestState,
      @required
          R Function(AreaListReceived) areaListReceived,
      @required
          R Function(AreaRequestReceived) areaRequestReceived,
      @required
          R Function(AreaViolationReceived) areaViolationReceived,
      @required
          R Function(LicensePlateViolationReceived)
              licensePlateViolationReceived,
      @required
          R Function(MyReportReceived) myReportReceived,
      @required
          R Function(ErrorRequestState) errorRequestState}) {
    switch (this._type) {
      case _RequestState.StartUpRequestState:
        return startUpRequestState(this as StartUpRequestState);
      case _RequestState.WaitingRequestState:
        return waitingRequestState(this as WaitingRequestState);
      case _RequestState.SelectAreaRequestState:
        return selectAreaRequestState(this as SelectAreaRequestState);
      case _RequestState.AreaListReceived:
        return areaListReceived(this as AreaListReceived);
      case _RequestState.AreaRequestReceived:
        return areaRequestReceived(this as AreaRequestReceived);
      case _RequestState.AreaViolationReceived:
        return areaViolationReceived(this as AreaViolationReceived);
      case _RequestState.LicensePlateViolationReceived:
        return licensePlateViolationReceived(
            this as LicensePlateViolationReceived);
      case _RequestState.MyReportReceived:
        return myReportReceived(this as MyReportReceived);
      case _RequestState.ErrorRequestState:
        return errorRequestState(this as ErrorRequestState);
    }
  }

  @override
  List get props => null;
}

@immutable
class StartUpRequestState extends RequestState {
  const StartUpRequestState._() : super(_RequestState.StartUpRequestState);

  factory StartUpRequestState() {
    _instance ??= StartUpRequestState._();
    return _instance;
  }

  static StartUpRequestState _instance;
}

@immutable
class WaitingRequestState extends RequestState {
  const WaitingRequestState._() : super(_RequestState.WaitingRequestState);

  factory WaitingRequestState() {
    _instance ??= WaitingRequestState._();
    return _instance;
  }

  static WaitingRequestState _instance;
}

@immutable
class SelectAreaRequestState extends RequestState {
  const SelectAreaRequestState._()
      : super(_RequestState.SelectAreaRequestState);

  factory SelectAreaRequestState() {
    _instance ??= SelectAreaRequestState._();
    return _instance;
  }

  static SelectAreaRequestState _instance;
}

@immutable
class AreaListReceived extends RequestState {
  const AreaListReceived({@required this.area})
      : super(_RequestState.AreaListReceived);

  final Area area;

  @override
  String toString() => 'AreaListReceived(area:${this.area})';
  @override
  List get props => [area];
}

@immutable
class AreaRequestReceived extends RequestState {
  const AreaRequestReceived({@required this.area})
      : super(_RequestState.AreaRequestReceived);

  final Area area;

  @override
  String toString() => 'AreaRequestReceived(area:${this.area})';
  @override
  List get props => [area];
}

@immutable
class AreaViolationReceived extends RequestState {
  const AreaViolationReceived({@required this.reportList})
      : super(_RequestState.AreaViolationReceived);

  final List<dynamic> reportList;

  @override
  String toString() => 'AreaViolationReceived(reportList:${this.reportList})';
  @override
  List get props => [reportList];
}

@immutable
class LicensePlateViolationReceived extends RequestState {
  const LicensePlateViolationReceived({@required this.reportList})
      : super(_RequestState.LicensePlateViolationReceived);

  final List<dynamic> reportList;

  @override
  String toString() =>
      'LicensePlateViolationReceived(reportList:${this.reportList})';
  @override
  List get props => [reportList];
}

@immutable
class MyReportReceived extends RequestState {
  const MyReportReceived({@required this.reportList})
      : super(_RequestState.MyReportReceived);

  final List<dynamic> reportList;

  @override
  String toString() => 'MyReportReceived(reportList:${this.reportList})';
  @override
  List get props => [reportList];
}

@immutable
class ErrorRequestState extends RequestState {
  const ErrorRequestState._() : super(_RequestState.ErrorRequestState);

  factory ErrorRequestState() {
    _instance ??= ErrorRequestState._();
    return _instance;
  }

  static ErrorRequestState _instance;
}
