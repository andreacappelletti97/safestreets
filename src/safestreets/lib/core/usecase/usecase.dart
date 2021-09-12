import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseFuture<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseSyncEither<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Type call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => null;
}
