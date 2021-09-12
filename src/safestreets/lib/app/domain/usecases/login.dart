import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class Login extends UseCase<User, Params> {
  final ProfileRepository profileRepository;

  Login({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) async =>
      await profileRepository.login(
        params.email,
        params.password,
      );
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
