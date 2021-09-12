import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/app/domain/usecases/get_area_request.dart' as gar;
import 'package:safestreets/app/domain/usecases/get_area_violation_request.dart'
    as gavr;
import 'package:safestreets/app/domain/usecases/get_license_plate_request.dart'
    as glpr;
import 'package:safestreets/app/domain/usecases/get_my_report.dart' as gmr;
import 'package:safestreets/core/error/failures.dart';
import './bloc.dart';
import 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final gar.GetAreaRequest getAreaRequest;
  final gavr.GetAreaViolationRequest getAreaViolationRequest;
  final glpr.GetLicensePlateRequest getLicensePlateRequest;
  final gmr.GetMyReport getMyReport;
  final UserBloc userBloc;

  RequestBloc({
    @required this.getAreaRequest,
    @required this.getAreaViolationRequest,
    @required this.getLicensePlateRequest,
    @required this.getMyReport,
    @required this.userBloc,
  });

  @override
  RequestState get initialState => RequestState.startUpRequestState();

  @override
  Stream<RequestState> mapEventToState(
    RequestEvent event,
  ) async* {
    yield* event.when(
      areaSelectedEvent: null,
      areaRequestEvent: (e) => _mapAreaRequestEvent(e),
      areaViolationRequestEvent: (e) => _mapAreaViolationRequestEvent(e),
      licensePlateRequestEvent: (e) => _mapLicensePlateRequestEvent(e),
      myReportRequestEvent: (e) => _mapMyReportRequestEvent(e),
      restoreRequestEvent: (e) => _mapRestoreRequestEvent(),
    );
  }

  Stream<RequestState> _mapRestoreRequestEvent() async* {
    yield RequestState.startUpRequestState();
  }

  /// Area Request from Normal User
  Stream<RequestState> _mapAreaRequestEvent(AreaRequestEvent event) async* {
    yield RequestState.waitingRequestState();

    final request = await getAreaRequest(
      gar.Params(
        userID: userID,
        area: event.area,
      ),
    );

    yield* request.fold(
      (Failure failure) async* {
        yield RequestState.errorRequestState();
      },
      (Area area) async* {
        yield RequestState.areaListReceived(
          area: area,
        );
      },
    );
  }

  /// Violation request from a specific Area from Authority
  Stream<RequestState> _mapAreaViolationRequestEvent(
      AreaViolationRequestEvent event) async* {
    yield RequestState.waitingRequestState();

    final request = await getAreaViolationRequest(
      gavr.Params(
        userID: userID,
        area: event.area,
      ),
    );

    yield* request.fold(
      (Failure failure) async* {
        yield RequestState.errorRequestState();
      },
      (List<Request> reportList) async* {
        yield RequestState.areaViolationReceived(reportList: reportList);
      },
    );
  }

  /// License Plate Violation Retrieve from Authority
  Stream<RequestState> _mapLicensePlateRequestEvent(
      LicensePlateRequestEvent event) async* {
    yield RequestState.waitingRequestState();

    final request = await getLicensePlateRequest(
      glpr.Params(
        userID: userID,
        licensePlate: event.licensePlate,
      ),
    );

    yield* request.fold(
      (Failure failure) async* {
        yield RequestState.errorRequestState();
      },
      (List<Request> reportList) async* {
        yield RequestState.licensePlateViolationReceived(
            reportList: reportList);
      },
    );
  }

  /// History of report Retrieve from Normal User
  Stream<RequestState> _mapMyReportRequestEvent(
      MyReportRequestEvent event) async* {
    yield RequestState.waitingRequestState();

    final request = await getMyReport(
      gmr.Params(
        userID: userID,
      ),
    );

    yield* request.fold(
      (Failure failure) async* {
        yield RequestState.errorRequestState();
      },
      (List<Request> reportList) async* {
        yield RequestState.myReportReceived(reportList: reportList);
      },
    );
  }

  String get userID => (userBloc.state as LoggedUserState).user.userID;
}
