import 'package:auto_route/auto_route_annotations.dart';
import 'package:safestreets/app/presentation/screen/home_screen.dart';
import 'package:safestreets/app/presentation/screen/license_screen.dart';
import 'package:safestreets/app/presentation/screen/loading_screen.dart';
import 'package:safestreets/app/presentation/screen/login_screen.dart';
import 'package:safestreets/app/presentation/screen/report_screen.dart';
import 'package:safestreets/app/presentation/screen/settings_screen.dart';

@autoRouter
class $Router {
  @initial
  LoadingScreen loadingScreen;

  LoginScreen loginScreen;
  HomeScreen homeScreen;
  ReportScreen reportScreen;
  SettingsScreen settingsScreen;
  LicenseScreen licenseScreen;
}
