import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/registration.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/repositories/registration_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class PostRegistration extends UseCase<User, Params> {
  final RegistrationRepository registrationRepository;

  PostRegistration({
    @required this.registrationRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await registrationRepository.postRegistration(params.registration);
  }
}

class Params extends Equatable {
  final Registration registration;

  const Params({
    @required this.registration,
  });

  @override
  List<Object> get props => [registration];
}
