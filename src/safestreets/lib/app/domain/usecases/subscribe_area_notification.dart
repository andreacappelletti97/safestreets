import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/domain/repositories/notification_repository.dart';
import 'package:safestreets/core/error/failures.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class SubscribeAreaNotification extends UseCase<void, Params> {
  final NotificationRepository notificationRepository;

  SubscribeAreaNotification({
    @required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await notificationRepository.subscribeAreaNotification(
      params.areaID,
    );
  }
}

class Params extends Equatable {
  final String areaID;

  const Params({
    @required this.areaID,
  });

  @override
  List<Object> get props => [areaID];
}
