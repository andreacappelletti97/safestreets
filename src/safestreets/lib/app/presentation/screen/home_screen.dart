import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:safestreets/app/presentation/bloc/request_state.dart';
import 'package:safestreets/app/presentation/widgets/loading_indicator.dart';
import 'package:safestreets/app/presentation/widgets/request_tile.dart';
import 'package:safestreets/core/router/router.gr.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    // Notification callback, open dialog

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        if ((BlocProvider.of<UserBloc>(context).state as LoggedUserState)
            .user
            .authority) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('CLOSE'),
                ),
              ],
              content: Column(
                children: <Widget>[
                  Text(
                    message['notification']['title'],
                  ),
                  Text(
                    message['notification']['body'],
                  ),
                ],
              ),
            ),
          );
        }
      },
      onResume: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _displayAppBar(context),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is EmptyUserState) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Router.loginScreen,
                  (_) => false,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<RequestBloc, RequestState>(
          builder: (context, state) {
            print("new state: $state");
            return _buildRequestBloc(context, state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Router.reportScreen);
        },
        child: Icon(Icons.photo_camera),
      ),
    );
  }

  Widget _buildRequestBloc(BuildContext context, RequestState state) {
    return state.when(
      areaRequestReceived: (_) => Text('Request recieved...'),
      selectAreaRequestState: (_) => Text('Area request selection...'),
      startUpRequestState: (_) => _displayRequestSelection(context),
      waitingRequestState: (_) => LoadingIndicator(
        message: 'Loading reports...',
      ),
      areaListReceived: (state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${state.area.safety}',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text('Number of violations'),
                Text(
                  '${state.area.numberOfViolations}',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            key: Key('openReport'),
            onPressed: () {
              BlocProvider.of<RequestBloc>(context).add(
                RequestEvent.restoreRequestEvent(),
              );
            },
            child: Text('Restore'),
          ),
        ],
      ),
      areaViolationReceived: (state) =>
          _displayRequestData(context, state.reportList),
      licensePlateViolationReceived: (state) =>
          _displayRequestData(context, state.reportList),
      myReportReceived: (state) =>
          _displayRequestData(context, state.reportList),
      errorRequestState: (_) => Column(
        children: <Widget>[
          Text("Error... request not found."),
          FlatButton(
            onPressed: () {
              BlocProvider.of<RequestBloc>(context).add(
                RequestEvent.restoreRequestEvent(),
              );
            },
            child: Text('Restore'),
          ),
        ],
      ),
    );
  }

  Widget _displayRequestSelection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            color: Colors.white,
            textColor: Colors.blue,
            onPressed: () => _getAreaRequest(context, 1),
            child: Text(
              "Get Area 1 Safety",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  textBaseline: TextBaseline.alphabetic),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            color: Colors.white,
            textColor: Colors.blue,
            onPressed: () => _getAreaRequest(context, 2),
            child: Text(
              "Get Area 2 Safety",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  textBaseline: TextBaseline.alphabetic),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            color: Colors.white,
            textColor: Colors.blue,
            onPressed: () => _getAreaRequest(context, 3),
            child: Text(
              "Get Area 3 Safety",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  textBaseline: TextBaseline.alphabetic),
            ),
          ),
          if ((BlocProvider.of<UserBloc>(context).state as LoggedUserState)
              .user
              .authority)
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => _getAreaViolationRequest(
                context,
                1,
              ),
              child: Text(
                "Get Area 1 Violation",
                style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    textBaseline: TextBaseline.alphabetic),
              ),
            ),
          if ((BlocProvider.of<UserBloc>(context).state as LoggedUserState)
              .user
              .authority)
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => _getAreaViolationRequest(
                context,
                2,
              ),
              child: Text(
                "Get Area 2 Violation",
                style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    textBaseline: TextBaseline.alphabetic),
              ),
            ),
          if ((BlocProvider.of<UserBloc>(context).state as LoggedUserState)
              .user
              .authority)
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => _getAreaViolationRequest(
                context,
                3,
              ),
              child: Text(
                "Get Area 3 Violation",
                style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    textBaseline: TextBaseline.alphabetic),
              ),
            ),
          if ((BlocProvider.of<UserBloc>(context).state as LoggedUserState)
              .user
              .authority)
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.white,
                textColor: Colors.blue,
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    Router.licenseScreen,
                  );
                  _getLicensePlateRequest(context, result);
                },
                child: Text(
                  "Get License Plate Information",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      textBaseline: TextBaseline.alphabetic),
                )),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              "Report History",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  textBaseline: TextBaseline.alphabetic),
            ),
            onPressed: () => _getMyReport(context),
          ),
        ],
      ),
    );
  }

  Widget _displayRequestData(
    BuildContext context,
    List<dynamic> data,
  ) {
    return Column(
      children: <Widget>[
        if (data.length == 0)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'No reports found...',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => RequestTile(
              request: (data[index] as Request),
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            BlocProvider.of<RequestBloc>(context).add(
              RequestEvent.restoreRequestEvent(),
            );
          },
          child: Text('Restore'),
        ),
      ],
    );
  }

  AppBar _displayAppBar(BuildContext context) {
    return AppBar(
      title: Text('SafeStreets'),
      actions: <Widget>[
        if ((BlocProvider.of<UserBloc>(context).state as LoggedUserState)
            .user
            .authority)
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                Router.settingsScreen,
              );
            },
          ),
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
          ),
          onPressed: () => _signOut(context),
        ),
      ],
    );
  }

  void _getAreaRequest(BuildContext context, int area) {
    BlocProvider.of<RequestBloc>(context).add(
      AreaRequestEvent(
        area: area,
      ),
    );
  }

  void _getAreaViolationRequest(BuildContext context, int area) {
    BlocProvider.of<RequestBloc>(context).add(
      AreaViolationRequestEvent(
        area: area,
      ),
    );
  }

  void _getLicensePlateRequest(BuildContext context, String licensePlate) {
    BlocProvider.of<RequestBloc>(context).add(
      LicensePlateRequestEvent(
        licensePlate: licensePlate,
      ),
    );
  }

  void _getMyReport(BuildContext context) {
    BlocProvider.of<RequestBloc>(context).add(
      MyReportRequestEvent(),
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      SignOutUserEvent(),
    );
  }
}
