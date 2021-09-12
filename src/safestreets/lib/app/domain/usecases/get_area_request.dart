import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/data/models/area.dart';
import 'package:safestreets/app/domain/repositories/request_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class GetAreaRequest extends UseCase<Area, Params> {
  final RequestRepository requestRepository;

  GetAreaRequest({
    @required this.requestRepository,
  });

  @override
  Future<Either<Failure, Area>> call(Params params) async {
    return await requestRepository.getAreaRequest(
      params.userID,
      params.area,
    );
  }
}

class Params extends Equatable {
  final String userID;
  final int area;

  const Params({
    @required this.userID,
    @required this.area,
  });

  @override
  List<Object> get props => [
        userID,
        area,
      ];
}
