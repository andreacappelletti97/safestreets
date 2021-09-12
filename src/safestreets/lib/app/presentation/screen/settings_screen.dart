import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocBuilder<NotificationBloc, BuiltList<bool>>(
        builder: (context, state) => SettingsList(
          sections: [
            SettingsSection(
              title: 'Notifications',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Area1',
                  subtitle: 'Activate notification area 1',
                  leading: Icon(Icons.not_listed_location),
                  switchValue: state[0],
                  onToggle: (value) => _updateValue(context, value, 0),
                ),
                SettingsTile.switchTile(
                  title: 'Area2',
                  subtitle: 'Activate notification area 2',
                  leading: Icon(Icons.not_listed_location),
                  switchValue: state[1],
                  onToggle: (value) => _updateValue(context, value, 1),
                ),
                SettingsTile.switchTile(
                  title: 'Area3',
                  subtitle: 'Activate notification area 3',
                  leading: Icon(Icons.not_listed_location),
                  switchValue: state[2],
                  onToggle: (value) => _updateValue(context, value, 2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateValue(BuildContext context, bool value, int index) {
    BlocProvider.of<NotificationBloc>(context).add(
      UpdateNotificationEvent(
        indexChange: index,
        newValue: value,
      ),
    );
  }
}
