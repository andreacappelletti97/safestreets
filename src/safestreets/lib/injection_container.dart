import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safestreets/app/data/datasources/camera_data_source.dart';
import 'package:safestreets/app/data/datasources/location_data_source.dart';
import 'package:safestreets/app/data/datasources/notification_local_data_source.dart';
import 'package:safestreets/app/data/datasources/notification_remote_data_source.dart';
import 'package:safestreets/app/data/datasources/profile_local_data_source.dart';
import 'package:safestreets/app/data/datasources/profile_remote_data_source.dart';
import 'package:safestreets/app/data/datasources/registration_remote_data_source.dart';
import 'package:safestreets/app/data/datasources/report_remote_data_source.dart';
import 'package:safestreets/app/data/datasources/request_remote_data_source.dart';
import 'package:safestreets/app/data/repositories/location_repository_impl.dart';
import 'package:safestreets/app/data/repositories/notification_repository_impl.dart';
import 'package:safestreets/app/data/repositories/profile_repository_impl.dart';
import 'package:safestreets/app/data/repositories/recognizer_repository_impl.dart';
import 'package:safestreets/app/data/repositories/registration_repository_impl.dart';
import 'package:safestreets/app/data/repositories/report_repository_impl.dart';
import 'package:safestreets/app/data/repositories/request_repository_impl.dart';
import 'package:safestreets/app/domain/repositories/location_repository.dart';
import 'package:safestreets/app/domain/repositories/notification_repository.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';
import 'package:safestreets/app/domain/repositories/recognizer_repository.dart';
import 'package:safestreets/app/domain/repositories/registration_repository.dart';
import 'package:safestreets/app/domain/repositories/report_repository.dart';
import 'package:safestreets/app/domain/repositories/request_repository.dart';
import 'package:safestreets/app/domain/usecases/get_area_request.dart';
import 'package:safestreets/app/domain/usecases/get_area_violation_request.dart';
import 'package:safestreets/app/domain/usecases/get_camera_image.dart';
import 'package:safestreets/app/domain/usecases/get_current_location.dart';
import 'package:safestreets/app/domain/usecases/get_license_plate_request.dart';
import 'package:safestreets/app/domain/usecases/get_my_report.dart';
import 'package:safestreets/app/domain/usecases/get_subscription_area.dart';
import 'package:safestreets/app/domain/usecases/get_user_id.dart';
import 'package:safestreets/app/domain/usecases/login.dart';
import 'package:safestreets/app/domain/usecases/logout.dart';
import 'package:safestreets/app/domain/usecases/post_registration.dart';
import 'package:safestreets/app/domain/usecases/post_report.dart';
import 'package:safestreets/app/domain/usecases/recognize_license_plate.dart';
import 'package:safestreets/app/domain/usecases/save_user_id.dart';
import 'package:safestreets/app/domain/usecases/subscribe_area_notification.dart';
import 'package:safestreets/app/domain/usecases/unsubscribe_area_notification.dart';
import 'package:safestreets/core/network/network_info.dart';
import 'package:safestreets/core/services/recognizer_service.dart';
import 'package:safestreets/core/services/registration_validation_service.dart';
import 'package:safestreets/core/services/report_validation_service.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:safestreets/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Bloc
  serviceLocator.registerLazySingleton<UserBloc>(
    () => UserBloc(
      getUserId: serviceLocator(),
      login: serviceLocator(),
      logout: serviceLocator(),
      postRegistration: serviceLocator(),
      saveUserId: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NotificationBloc>(
    () => NotificationBloc(
      unsubscribeAreaNotification: serviceLocator(),
      subscribeAreaNotification: serviceLocator(),
      getSubscriptionArea: serviceLocator(),
      userBloc: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<ReportBloc>(
    () => ReportBloc(
      userBloc: serviceLocator(),
      getCameraImage: serviceLocator(),
      getCurrentLocation: serviceLocator(),
      recognizeLicensePlate: serviceLocator(),
      postReport: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<RequestBloc>(
    () => RequestBloc(
      getLicensePlateRequest: serviceLocator(),
      getMyReport: serviceLocator(),
      getAreaViolationRequest: serviceLocator(),
      getAreaRequest: serviceLocator(),
      userBloc: serviceLocator(),
    ),
  );

  // Repositories
  serviceLocator.registerLazySingleton<RegistrationRepository>(
    () => RegistrationRepositoryImpl(
      registrationRemoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
      registrationValidationService: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ReportRepository>(
    () => ReportRepositoryImpl(
      reportRemoteDataSource: serviceLocator(),
      cameraDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
      reportValidationService: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locationDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RequestRepository>(
    () => RequestRepositoryImpl(
      networkInfo: serviceLocator(),
      requestRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      notificationLocalDataSource: serviceLocator(),
      notificationRemoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileLocalDataSource: serviceLocator(),
      profileRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RecognizerRepository>(
    () => RecognizerRepositoryImpl(
      recognizerService: serviceLocator(),
    ),
  );

  // Usecases
  serviceLocator.registerLazySingleton(
    () => PostRegistration(
      registrationRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => PostReport(
      reportRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetSubscriptionArea(
      notificationRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetCameraImage(
      reportRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetCurrentLocation(
      locationRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetAreaRequest(
      requestRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetAreaViolationRequest(
      requestRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetLicensePlateRequest(
      requestRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetMyReport(
      requestRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SubscribeAreaNotification(
      notificationRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UnsubscribeAreaNotification(
      notificationRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => Login(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => Logout(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SaveUserId(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetUserId(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => RecognizeLicensePlate(
      recognizerRepository: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RegistrationRemoteDataSource>(
    () => RegistrationFirebaseFunctionRemoteDataSource(
      profileRemoteDataSource: serviceLocator(),
      client: serviceLocator(),
      url:
          'https://us-central1-safestreets-sweg19cams.cloudfunctions.net/storeUserProfile',
    ),
  );

  serviceLocator.registerLazySingleton<ReportRemoteDataSource>(
    () => ReportRemoteDataSourceImpl(
      firestore: serviceLocator(),
      storageService: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<CameraDataSource>(
    () => CameraImagePickerImpl(),
  );

  serviceLocator.registerLazySingleton<LocationDataSource>(
    () => LocationGeolocatorImpl(
      geolocator: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RequestRemoteDataSource>(
    () => RequestRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(
      firebaseMessaging: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      firebaseAuth: serviceLocator(),
      firestore: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  // Services
  serviceLocator.registerLazySingleton<RecognizerService>(
    () => RecognizerFirebaseML(
      firebaseVision: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<StorageService>(
    () => StorageServiceImpl(),
  );

  serviceLocator.registerLazySingleton<RegistrationValidationService>(
    () => RegistrationValidationService(),
  );

  serviceLocator.registerLazySingleton<ReportValidationService>(
    () => ReportValidationService(),
  );

  // External
  serviceLocator.registerLazySingleton(
    () => GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ),
  );

  serviceLocator.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  serviceLocator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  serviceLocator.registerLazySingleton<Firestore>(
    () => Firestore.instance,
  );

  serviceLocator.registerLazySingleton<FirebaseVision>(
    () => FirebaseVision.instance,
  );

  serviceLocator.registerLazySingleton<FirebaseMessaging>(
    () => FirebaseMessaging(),
  );

  serviceLocator.registerLazySingleton<Geolocator>(
    () => Geolocator(),
  );

  serviceLocator.registerLazySingleton(
    () => DataConnectionChecker(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
}
