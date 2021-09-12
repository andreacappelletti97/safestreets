import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/user.dart';
import 'package:safestreets/app/domain/repositories/profile_repository.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class SaveUserId extends UseCaseFuture<void, Params> {
  final ProfileRepository profileRepository;

  SaveUserId({
    @required this.profileRepository,
  });

  @override
  Future<void> call(Params params) async {
    return await profileRepository.saveUser(params.user);
  }
}

class Params extends Equatable {
  final User user;

  const Params({
    @required this.user,
  });

  @override
  List<Object> get props => [user];
}
