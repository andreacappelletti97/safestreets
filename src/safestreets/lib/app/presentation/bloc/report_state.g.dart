// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ReportState extends Equatable {
  const ReportState(this._type);

  factory ReportState.initalReportState() = InitalReportState;

  factory ReportState.takingImageReportState() = TakingImageReportState;

  factory ReportState.recognizingReportState() = RecognizingReportState;

  factory ReportState.gettingLocationReportState() = GettingLocationReportState;

  factory ReportState.noLicensePlateReportState({@required Report report}) =
      NoLicensePlateReportState;

  factory ReportState.withLicensePlateReportState({@required Report report}) =
      WithLicensePlateReportState;

  factory ReportState.postingReportState() = PostingReportState;

  factory ReportState.errorReportState({@required String message}) =
      ErrorReportState;

  factory ReportState.completeReportState({@required String reportID}) =
      CompleteReportState;

  final _ReportState _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(InitalReportState) initalReportState,
      @required
          R Function(TakingImageReportState) takingImageReportState,
      @required
          R Function(RecognizingReportState) recognizingReportState,
      @required
          R Function(GettingLocationReportState) gettingLocationReportState,
      @required
          R Function(NoLicensePlateReportState) noLicensePlateReportState,
      @required
          R Function(WithLicensePlateReportState) withLicensePlateReportState,
      @required
          R Function(PostingReportState) postingReportState,
      @required
          R Function(ErrorReportState) errorReportState,
      @required
          R Function(CompleteReportState) completeReportState}) {
    switch (this._type) {
      case _ReportState.InitalReportState:
        return initalReportState(this as InitalReportState);
      case _ReportState.TakingImageReportState:
        return takingImageReportState(this as TakingImageReportState);
      case _ReportState.RecognizingReportState:
        return recognizingReportState(this as RecognizingReportState);
      case _ReportState.GettingLocationReportState:
        return gettingLocationReportState(this as GettingLocationReportState);
      case _ReportState.NoLicensePlateReportState:
        return noLicensePlateReportState(this as NoLicensePlateReportState);
      case _ReportState.WithLicensePlateReportState:
        return withLicensePlateReportState(this as WithLicensePlateReportState);
      case _ReportState.PostingReportState:
        return postingReportState(this as PostingReportState);
      case _ReportState.ErrorReportState:
        return errorReportState(this as ErrorReportState);
      case _ReportState.CompleteReportState:
        return completeReportState(this as CompleteReportState);
    }
  }

  @override
  List get props => null;
}

@immutable
class InitalReportState extends ReportState {
  const InitalReportState._() : super(_ReportState.InitalReportState);

  factory InitalReportState() {
    _instance ??= InitalReportState._();
    return _instance;
  }

  static InitalReportState _instance;
}

@immutable
class TakingImageReportState extends ReportState {
  const TakingImageReportState._() : super(_ReportState.TakingImageReportState);

  factory TakingImageReportState() {
    _instance ??= TakingImageReportState._();
    return _instance;
  }

  static TakingImageReportState _instance;
}

@immutable
class RecognizingReportState extends ReportState {
  const RecognizingReportState._() : super(_ReportState.RecognizingReportState);

  factory RecognizingReportState() {
    _instance ??= RecognizingReportState._();
    return _instance;
  }

  static RecognizingReportState _instance;
}

@immutable
class GettingLocationReportState extends ReportState {
  const GettingLocationReportState._()
      : super(_ReportState.GettingLocationReportState);

  factory GettingLocationReportState() {
    _instance ??= GettingLocationReportState._();
    return _instance;
  }

  static GettingLocationReportState _instance;
}

@immutable
class NoLicensePlateReportState extends ReportState {
  const NoLicensePlateReportState({@required this.report})
      : super(_ReportState.NoLicensePlateReportState);

  final Report report;

  @override
  String toString() => 'NoLicensePlateReportState(report:${this.report})';
  @override
  List get props => [report];
}

@immutable
class WithLicensePlateReportState extends ReportState {
  const WithLicensePlateReportState({@required this.report})
      : super(_ReportState.WithLicensePlateReportState);

  final Report report;

  @override
  String toString() => 'WithLicensePlateReportState(report:${this.report})';
  @override
  List get props => [report];
}

@immutable
class PostingReportState extends ReportState {
  const PostingReportState._() : super(_ReportState.PostingReportState);

  factory PostingReportState() {
    _instance ??= PostingReportState._();
    return _instance;
  }

  static PostingReportState _instance;
}

@immutable
class ErrorReportState extends ReportState {
  const ErrorReportState({@required this.message})
      : super(_ReportState.ErrorReportState);

  final String message;

  @override
  String toString() => 'ErrorReportState(message:${this.message})';
  @override
  List get props => [message];
}

@immutable
class CompleteReportState extends ReportState {
  const CompleteReportState({@required this.reportID})
      : super(_ReportState.CompleteReportState);

  final String reportID;

  @override
  String toString() => 'CompleteReportState(reportID:${this.reportID})';
  @override
  List get props => [reportID];
}
