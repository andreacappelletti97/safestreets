import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/request.dart';
import 'package:safestreets/app/domain/repositories/request_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class GetMyReport extends UseCase<List<Request>, Params> {
  final RequestRepository requestRepository;

  GetMyReport({
    @required this.requestRepository,
  });

  @override
  Future<Either<Failure, List<Request>>> call(Params params) async {
    return await requestRepository.getMyReport(params.userID);
  }
}

class Params extends Equatable {
  final String userID;

  const Params({
    @required this.userID,
  });

  @override
  List<Object> get props => [userID];
}
