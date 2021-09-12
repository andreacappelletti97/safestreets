import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safestreets/core/router/router.gr.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:safestreets/injection_container.dart' as di;

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print(data);
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print(notification);
  }

  // Or do other work.
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.configure(
    onBackgroundMessage: myBackgroundMessageHandler,
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    },
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => di.serviceLocator<UserBloc>()
            ..add(
              GetLocalUserEvent(),
            ),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => di.serviceLocator<NotificationBloc>(),
        ),
        BlocProvider<RequestBloc>(
          create: (context) => di.serviceLocator<RequestBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'SafeStreets',
        onGenerateRoute: Router.onGenerateRoute,
        initialRoute: Router.loadingScreen,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
