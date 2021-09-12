import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/usecases/get_user_id.dart' as uid;
import 'package:safestreets/app/domain/usecases/login.dart' as lin;
import 'package:safestreets/app/domain/usecases/logout.dart' as lout;
import 'package:safestreets/app/domain/usecases/post_registration.dart' as prg;
import 'package:safestreets/app/domain/usecases/save_user_id.dart' as sid;
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final lin.Login login;
  final lout.Logout logout;
  final uid.GetUserId getUserId;
  final prg.PostRegistration postRegistration;
  final sid.SaveUserId saveUserId;

  UserBloc({
    @required this.login,
    @required this.logout,
    @required this.getUserId,
    @required this.saveUserId,
    @required this.postRegistration,
  });

  @override
  UserState get initialState => UserState.startUpUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield* event.when(
      getLocalUserEvent: (e) => _mapGetLocalUserEvent(e),
      signInUserEvent: (e) => _mapSignInUserEvent(e),
      signOutUserEvent: (e) => _mapSignOutUserEvent(e),
      signUpUserEvent: (e) => _mapSignUpUserEvent(e),
    );
  }

  Stream<UserState> _mapSignUpUserEvent(SignUpUserEvent event) async* {
    yield UserState.loadingUserState();

    final userData = Registration(
      (r) => r
        ..name = event.name
        ..surname = event.surname
        ..email = event.email
        ..password = event.password,
    );

    final failOrUserID = await postRegistration(
      prg.Params(
        registration: userData,
      ),
    );

    yield* failOrUserID.fold(
      (Failure failure) async* {
        yield UserState.emptyUserState(
          status: 'Wrong data, impossible to sign up',
        );
      },
      (User user) async* {
        await saveUserId(
          sid.Params(
            user: user,
          ),
        );

        yield UserState.loggedUserState(user: user);
      },
    );
  }

  Stream<UserState> _mapGetLocalUserEvent(GetLocalUserEvent event) async* {
    yield UserState.loadingUserState();
    final failOrUserID = getUserId(
      NoParams(),
    );

    yield* failOrUserID.fold(
      (Failure failure) async* {
        yield UserState.emptyUserState(status: 'Missing user local');
      },
      (User user) async* {
        yield UserState.loggedUserState(user: user);
      },
    );
  }

  Stream<UserState> _mapSignInUserEvent(SignInUserEvent event) async* {
    yield UserState.loadingUserState();
    final failOrUserID = await login(
      lin.Params(
        email: event.email,
        password: event.password,
      ),
    );

    yield* failOrUserID.fold(
      (Failure failure) async* {
        yield UserState.emptyUserState(
            status: 'Impossible to sign in, try again');
      },
      (User user) async* {
        await saveUserId(
          sid.Params(
            user: user,
          ),
        );

        yield UserState.loggedUserState(user: user);
      },
    );
  }

  Stream<UserState> _mapSignOutUserEvent(SignOutUserEvent event) async* {
    yield UserState.loadingUserState();
    await logout(
      NoParams(),
    );

    yield UserState.emptyUserState(status: 'Logged out');
  }
}
