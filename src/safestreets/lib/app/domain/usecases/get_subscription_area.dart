import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/app/domain/repositories/notification_repository.dart';
import 'package:safestreets/core/usecase/usecase.dart';

class GetSubscriptionArea extends UseCaseFuture<bool, Params> {
  final NotificationRepository notificationRepository;

  GetSubscriptionArea({
    @required this.notificationRepository,
  });

  @override
  Future<bool> call(Params params) async =>
      await notificationRepository.getSubscriptionArea(
        params.areaID,
      );
}

class Params extends Equatable {
  final String areaID;

  const Params({
    @required this.areaID,
  });

  @override
  List<Object> get props => [areaID];
}
