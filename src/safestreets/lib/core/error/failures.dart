import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FirebaseRegistrationFailure implements Failure {
  @override
  List<Object> get props => null;
}

class PostingReportFailure implements Failure {
  @override
  List<Object> get props => null;
}

class FirebaseMLFailure implements Failure {
  @override
  List<Object> get props => null;
}

class FirebaseAuthFailure implements Failure {
  final String message;

  const FirebaseAuthFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class FirebaseStorageFailure implements Failure {
  final String message;

  const FirebaseStorageFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class FirestoreFailure implements Failure {
  final String message;

  const FirestoreFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LocalUserMissing implements Failure {
  @override
  List<Object> get props => null;
}

class LocalNotificationFailure implements Failure {
  @override
  List<Object> get props => null;
}

class NoInternetConnectionFailure implements Failure {
  @override
  List<Object> get props => null;
}

class ValidationFailure implements Failure {
  final String message;

  const ValidationFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}
