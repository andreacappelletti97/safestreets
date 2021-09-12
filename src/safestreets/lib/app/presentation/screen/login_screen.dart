import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safestreets/app/presentation/bloc/bloc.dart';
import 'package:safestreets/app/presentation/widgets/loading_indicator.dart';
import 'package:safestreets/app/presentation/widgets/text_input_field.dart';
import 'package:safestreets/core/router/router.gr.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _bottomNavigationIndex = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is LoggedUserState) {
            Navigator.of(context).pushReplacementNamed(
              Router.homeScreen,
            );
          }
        },
        child: SingleChildScrollView(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.when(
                startUpUserState: (_) => LoadingIndicator(
                  message: 'Starting...',
                ),
                loadingUserState: (_) => LoadingIndicator(
                  message: 'Loading...',
                ),
                loggedUserState: (_) => Text(
                  'Success',
                ),
                errorUserState: (state) => Text(
                  '${state.message}',
                ),
                emptyUserState: (state) => Column(
                  children: <Widget>[
                    if (_bottomNavigationIndex == 1)
                      TextInputField(
                        label: 'Name',
                        controller: _nameController,
                      ),
                    if (_bottomNavigationIndex == 1)
                      TextInputField(
                        label: 'Surname',
                        controller: _surnameController,
                      ),
                    TextInputField(
                      key: Key('email_input'),
                      label: 'Email',
                      controller: _emailController,
                    ),
                    TextInputField(
                      key: Key('password_input'),
                      label: 'Password',
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    Text('${state.status}', key: Key('test'),),
                    if (_bottomNavigationIndex == 0)
                      RaisedButton(
                        key: Key('sign_in_button'),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: _signIn,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      ),
                    if (_bottomNavigationIndex == 1)
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: _signUp,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationIndex,
        onTap: (index) {
          setState(
            () => _bottomNavigationIndex = index,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_pin),
            title: Text('Sign in'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            title: Text('Sign up'),
          ),
        ],
      ),
    );
  }

  void _signIn() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    BlocProvider.of<UserBloc>(context).add(
      SignInUserEvent(
        email: email,
        password: password,
      ),
    );
  }

  void _signUp() {
    final String name = _nameController.text;
    final String surname = _surnameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    BlocProvider.of<UserBloc>(context).add(
      SignUpUserEvent(
        name: name,
        surname: surname,
        email: email,
        password: password,
      ),
    );
  }
}
