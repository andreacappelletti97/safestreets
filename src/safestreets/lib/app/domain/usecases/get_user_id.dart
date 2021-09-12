import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class GetUserId extends UseCaseSyncEither<User, NoParams> {
  final ProfileRepository profileRepository;

  GetUserId({
    @required this.profileRepository,
  });

  @override
  Either<Failure, User> call(NoParams params) => profileRepository.getUser();
}
