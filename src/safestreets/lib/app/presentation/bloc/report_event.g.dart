// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ReportEvent extends Equatable {
  const ReportEvent(this._type);

  factory ReportEvent.takeImageReportEvent() = TakeImageReportEvent;

  factory ReportEvent.getLocationReportEvent() = GetLocationReportEvent;

  factory ReportEvent.recognizeReportEvent() = RecognizeReportEvent;

  factory ReportEvent.postReportEvent(
      {@required String code, @required int type}) = PostReportEvent;

  final _ReportEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(TakeImageReportEvent) takeImageReportEvent,
      @required R Function(GetLocationReportEvent) getLocationReportEvent,
      @required R Function(RecognizeReportEvent) recognizeReportEvent,
      @required R Function(PostReportEvent) postReportEvent}) {
    switch (this._type) {
      case _ReportEvent.TakeImageReportEvent:
        return takeImageReportEvent(this as TakeImageReportEvent);
      case _ReportEvent.GetLocationReportEvent:
        return getLocationReportEvent(this as GetLocationReportEvent);
      case _ReportEvent.RecognizeReportEvent:
        return recognizeReportEvent(this as RecognizeReportEvent);
      case _ReportEvent.PostReportEvent:
        return postReportEvent(this as PostReportEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class TakeImageReportEvent extends ReportEvent {
  const TakeImageReportEvent._() : super(_ReportEvent.TakeImageReportEvent);

  factory TakeImageReportEvent() {
    _instance ??= TakeImageReportEvent._();
    return _instance;
  }

  static TakeImageReportEvent _instance;
}

@immutable
class GetLocationReportEvent extends ReportEvent {
  const GetLocationReportEvent._() : super(_ReportEvent.GetLocationReportEvent);

  factory GetLocationReportEvent() {
    _instance ??= GetLocationReportEvent._();
    return _instance;
  }

  static GetLocationReportEvent _instance;
}

@immutable
class RecognizeReportEvent extends ReportEvent {
  const RecognizeReportEvent._() : super(_ReportEvent.RecognizeReportEvent);

  factory RecognizeReportEvent() {
    _instance ??= RecognizeReportEvent._();
    return _instance;
  }

  static RecognizeReportEvent _instance;
}

@immutable
class PostReportEvent extends ReportEvent {
  const PostReportEvent({@required this.code, @required this.type})
      : super(_ReportEvent.PostReportEvent);

  final String code;

  final int type;

  @override
  String toString() => 'PostReportEvent(code:${this.code},type:${this.type})';
  @override
  List get props => [code, type];
}
