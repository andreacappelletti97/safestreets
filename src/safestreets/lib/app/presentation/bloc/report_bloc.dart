import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:safestreets/app/data/models/image.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/app/domain/usecases/get_camera_image.dart';
import 'package:safestreets/app/domain/usecases/get_current_location.dart';
import 'package:safestreets/app/domain/usecases/post_report.dart' as pr;
import 'package:safestreets/app/domain/usecases/recognize_license_plate.dart'
    as rlp;
import 'package:safestreets/core/enums/license_plate_source.dart';
import 'package:safestreets/core/enums/violation_type.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';
import './bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final UserBloc userBloc;
  final GetCameraImage getCameraImage;
  final rlp.RecognizeLicensePlate recognizeLicensePlate;
  final GetCurrentLocation getCurrentLocation;
  final pr.PostReport postReport;

  ReportBloc({
    @required this.userBloc,
    @required this.postReport,
    @required this.getCameraImage,
    @required this.recognizeLicensePlate,
    @required this.getCurrentLocation,
  });

  @override
  ReportState get initialState => ReportState.initalReportState();

  @override
  Stream<ReportState> mapEventToState(
    ReportEvent event,
  ) async* {
    yield* event.when(
      takeImageReportEvent: (e) => _mapTakeImageReportEvent(e),
      getLocationReportEvent: (e) => _mapGetLocationReportEvent(e),
      recognizeReportEvent: (e) => _mapRecognizeReportEvent(e),
      postReportEvent: (e) => _mapPostReportEvent(e),
    );
  }

  Stream<ReportState> _mapTakeImageReportEvent(
      TakeImageReportEvent event) async* {
    yield ReportState.takingImageReportState();
    if (userBloc.state is LoggedUserState) {
      final userID = (userBloc.state as LoggedUserState).user.userID;

      // 1. Taking the image
      final image = await getCameraImage(
        NoParams(),
      );

      yield ReportState.recognizingReportState();

      final failOrLicensePlate = await recognizeLicensePlate(
        rlp.Params(
          image: image,
        ),
      );

      yield* failOrLicensePlate.fold(
        (Failure failure) async* {
          yield ReportState.gettingLocationReportState();
          final reportNoLicensePlate = await _getLocationAndBuildReport(
            userID,
            image,
          );

          yield ReportState.noLicensePlateReportState(
            report: reportNoLicensePlate,
          );
        },
        (LicensePlate licensePlate) async* {
          yield ReportState.gettingLocationReportState();
          final reportWithLicensePlate = await _getLocationAndBuildReport(
            userID,
            image,
          );

          yield ReportState.withLicensePlateReportState(
            report: reportWithLicensePlate,
          );
        },
      );
    } else {
      yield ReportState.errorReportState(
        message: 'User not logged in, try again',
      );
    }
  }

  Stream<ReportState> _mapGetLocationReportEvent(
      GetLocationReportEvent event) async* {}
  Stream<ReportState> _mapRecognizeReportEvent(
      RecognizeReportEvent event) async* {}

  Stream<ReportState> _mapPostReportEvent(PostReportEvent event) async* {
    yield ReportState.postingReportState();
    Report rep;
    ViolationType type = ViolationType.generic;
    switch (event.type) {
      case 1:
        type = ViolationType.parking;
        break;
      case 2:
        type = ViolationType.noAuth;
        break;
      case 3:
        type = ViolationType.noPay;
        break;
    }

    if (state is WithLicensePlateReportState) {
      rep = (state as WithLicensePlateReportState).report;
    } else if (state is NoLicensePlateReportState) {
      rep = (state as NoLicensePlateReportState).report;
    } else {
      yield ReportState.errorReportState(
        message: 'Missing License Plate code, add it manually',
      );
    }

    if (rep != null) {
      final postRep = rep.rebuild(
        (r) => r
          ..licensePlate = LicensePlate(
            (l) => l
              ..code = event.code
              ..licensePlateSource = LicensePlateSource.user,
          ).toBuilder()
          ..violationType = type,
      );

      final failOrPosted = await postReport(
        pr.Params(
          report: postRep,
        ),
      );

      yield* failOrPosted.fold(
        (Failure failure) async* {
          yield ReportState.errorReportState(
            message: 'Error while posting the report, try again',
          );
        },
        (String reportID) async* {
          yield ReportState.completeReportState(
            reportID: reportID,
          );
        },
      );
    }
  }

  Future<Report> _getLocationAndBuildReport(String userID, Image image) async {
    final location = await getCurrentLocation(
      NoParams(),
    );

    final report = Report(
      (r) => r
        ..image.file = image.file
        ..image.name = image.name
        ..location.position = location.position
        ..userID = userID
        ..violationType = ViolationType.generic
        ..licensePlate.code = ''
        ..licensePlate.licensePlateSource = LicensePlateSource.recognizer,
    );

    return report;
  }
}
