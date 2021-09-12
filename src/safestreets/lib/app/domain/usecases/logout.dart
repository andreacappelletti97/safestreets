import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class Logout extends UseCase<void, NoParams> {
  final ProfileRepository profileRepository;

  Logout({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      profileRepository.logout();
}
