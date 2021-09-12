// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:safestreets/app/presentation/screen/loading_screen.dart';
import 'package:safestreets/app/presentation/screen/login_screen.dart';
import 'package:safestreets/app/presentation/screen/home_screen.dart';
import 'package:safestreets/app/presentation/screen/report_screen.dart';
import 'package:safestreets/app/presentation/screen/settings_screen.dart';
import 'package:safestreets/app/presentation/screen/license_screen.dart';

class Router {
  static const loadingScreen = '/';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static const reportScreen = '/reportScreen';
  static const settingsScreen = '/settingsScreen';
  static const licenseScreen = '/licenseScreen';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loadingScreen:
        return MaterialPageRoute(
          builder: (_) => LoadingScreen(),
          settings: settings,
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case reportScreen:
        return MaterialPageRoute(
          builder: (_) => ReportScreen(),
          settings: settings,
        );
      case settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );
      case licenseScreen:
        return MaterialPageRoute(
          builder: (_) => LicenseScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
