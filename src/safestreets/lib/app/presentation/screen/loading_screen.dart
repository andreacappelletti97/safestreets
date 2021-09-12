import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:safestreets/app/presentation/widgets/loading_indicator.dart';
import 'package:safestreets/core/router/router.gr.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is EmptyUserState) {
                Navigator.of(context).pushReplacementNamed(
                  Router.loginScreen,
                );
              } else if (state is LoggedUserState) {
                Navigator.of(context).pushReplacementNamed(
                  Router.homeScreen,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => _buildUserBloc(context, state),
        ),
      ),
    );
  }

  Widget _buildUserBloc(BuildContext context, UserState state) {
    return state.when(
      startUpUserState: (_) => LoadingIndicator(
        message: 'Starting up...',
      ),
      loadingUserState: (_) => LoadingIndicator(
        message: 'Sign in user...',
      ),
      loggedUserState: (_) => LoadingIndicator(
        message: 'Success...',
      ),
      emptyUserState: (state) => LoadingIndicator(
        message: state.status,
      ),
      errorUserState: (state) => LoadingIndicator(
        message: state.message,
      ),
    );
  }
}
