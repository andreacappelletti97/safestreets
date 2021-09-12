import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safestreets/app/data/models/report.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:safestreets/app/presentation/widgets/loading_indicator.dart';
import 'package:safestreets/app/presentation/widgets/text_input_field.dart';
import 'package:safestreets/injection_container.dart';

const List<String> VIOLATION_LABELS = [
  'Generic',
  'Parking',
  'No authorized',
  'No payment',
];

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ReportBloc>(
            create: (context) => serviceLocator<ReportBloc>()
              ..add(
                TakeImageReportEvent(),
              ),
          )
        ],
        child: ReportContent(),
      );
}

class ReportContent extends StatefulWidget {
  @override
  _ReportContentState createState() => _ReportContentState();
}

class _ReportContentState extends State<ReportContent> {
  TextEditingController _codeController = TextEditingController();
  List<bool> _toggleSelected = [true, false, false, false];
  String _violationLabel = VIOLATION_LABELS[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting'),
      ),
      body: MultiBlocListener(
        listeners: [],
        child: BlocBuilder<ReportBloc, ReportState>(
          builder: (context, state) => _buildReportBloc(context, state),
        ),
      ),
    );
  }

  Widget _buildReportBloc(BuildContext context, ReportState state) {
    return state.when(
      initalReportState: (_) => LoadingIndicator(
        message: 'Initializing...',
      ),
      takingImageReportState: (_) => LoadingIndicator(
        message: 'Taking picture...',
      ),
      recognizingReportState: (_) => LoadingIndicator(
        message: 'Machine Learning is working...',
      ),
      gettingLocationReportState: (_) => LoadingIndicator(
        message: 'Getting current location...',
      ),
      noLicensePlateReportState: (state) => _displayAddType(
        context,
        state.report,
      ),
      withLicensePlateReportState: (state) => _displayAddType(
        context,
        state.report,
      ),
      postingReportState: (_) => LoadingIndicator(
        message: 'Posting report...',
      ),
      errorReportState: (state) => LoadingIndicator(
        message: '${state.message}',
      ),
      completeReportState: (state) => Center(
        child: Text(
          'Report sent successfully, thanks for your contribution',
        ),
      ),
    );
  }

  Widget _displayAddType(BuildContext context, Report report) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 300,
            width: 300,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.contain,
              child: Image.file(report.image.file),
            ),
          ),
          Text('Latitude: ${report.location.position.latitude}'),
          Text('Longitude: ${report.location.position.longitude}'),
          TextInputField(
            label: 'Insert license plate code',
            controller: _codeController,
          ),
          ToggleButtons(
            children: [
              Icon(Icons.error),
              Icon(Icons.local_parking),
              Icon(Icons.phonelink_lock),
              Icon(Icons.money_off),
            ],
            isSelected: _toggleSelected,
            onPressed: (index) {
              _violationLabel = VIOLATION_LABELS[index];
              setState(() {
                _toggleSelected = List<bool>.generate(
                  4,
                  (i) => i == index,
                );
              });
            },
          ),
          Text(
            _violationLabel,
            style: TextStyle(
              color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                textBaseline: TextBaseline.alphabetic),
          ),
          SizedBox(
            height: 24,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            color: Colors.white,
            textColor: Colors.blue,
            onPressed: () => _postReport(context),
            child: Text(
              'Send Report',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  textBaseline: TextBaseline.alphabetic),
            ),
          ),
        ],
      ),
    );
  }

  void _postReport(BuildContext context) {
    final code = _codeController.text;
    final type = _toggleSelected.indexOf(true);

    if (code.length != 7) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Insert valid licese plate code'),
        ),
      );
    } else {
      BlocProvider.of<ReportBloc>(context).add(
        PostReportEvent(
          code: code,
          type: type,
        ),
      );
    }
  }
}
