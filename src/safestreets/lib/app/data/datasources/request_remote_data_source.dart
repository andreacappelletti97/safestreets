import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/app/data/models/license_plate.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

const String FIRESTORE_REQUEST_COLLECTION = 'request';

abstract class RequestRemoteDataSource {
  /// Get safety and violation frequency of all areas from remote database
  Future<Area> getAreaRemote(String userID, int area);

  /// Get list of violations registered inside [Area]
  ///
  /// Only for authorities!
  Future<List<Request>> getViolationInAreaRemote(int area, String userID);

  /// Get list of violations registered for [LicensePlate]
  ///
  /// Only for authorities!
  Future<List<Request>> getViolationFromLicensePlateRemote(
    String licensePlate,
    String userID,
  );

  /// Get list of report sent by the current [User]
  Future<List<Request>> getMyReportRemote(String userID);
}

class RequestRemoteDataSourceImpl implements RequestRemoteDataSource {
  final http.Client client;

  const RequestRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<Area> getAreaRemote(
    String userID,
    int area,
  ) async {
    try {
      final resp = await client.post(
        'https://us-central1-safestreets-sweg19cams.cloudfunctions.net/getAreaSafety',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "areaID": area,
        }),
      );

      if (resp.statusCode != 200) {
        throw FirestoreException();
      } else {
        return Area.fromJson(jsonDecode(resp.body));
      }
    } catch (e) {
      throw FirestoreException();
    }
  }

  @override
  Future<List<Request>> getViolationInAreaRemote(
    int area,
    String userID,
  ) async {
    try {
      final resp = await client.post(
        'https://us-central1-safestreets-sweg19cams.cloudfunctions.net/getAreaViolation',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "areaID": area,
        }),
      );

      if (resp.statusCode != 200) {
        throw FirestoreException();
      } else {
        final dataList = jsonDecode(resp.body) as List<dynamic>;
        final requestList = dataList
            .map(
              (data) => Request.fromJson(jsonEncode(data)),
            )
            .toList();
        return requestList;
      }
    } catch (e) {
      throw FirestoreException();
    }
  }

  @override
  Future<List<Request>> getViolationFromLicensePlateRemote(
      String licensePlate, String userID) async {
    try {
      final resp = await client.post(
        'https://us-central1-safestreets-sweg19cams.cloudfunctions.net/getLicensePlate',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "code": licensePlate,
        }),
      );

      if (resp.statusCode != 200) {
        throw FirestoreException();
      } else {
        final dataList = jsonDecode(resp.body) as List<dynamic>;
        final requestList = dataList
            .map(
              (data) => Request.fromJson(jsonEncode(data)),
            )
            .toList();
        return requestList;
      }
    } catch (e) {
      throw FirestoreException();
    }
  }

  @override
  Future<List<Request>> getMyReportRemote(String userID) async {
    try {
      final resp = await client.post(
        'https://us-central1-safestreets-sweg19cams.cloudfunctions.net/getMyReport',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "uid": userID,
        }),
      );

      if (resp.statusCode != 200) {
        throw FirestoreException();
      } else {
        final dataList = jsonDecode(resp.body) as List<dynamic>;
        final requestList = dataList
            .map(
              (data) => Request.fromJson(jsonEncode(data)),
            )
            .toList();
        return requestList;
      }
    } catch (e) {
      throw FirestoreException();
    }
  }
}
