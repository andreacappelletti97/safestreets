import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:safestreets/app/data/datasources/notification_local_data_source.dart';
import 'package:safestreets/app/domain/usecases/get_subscription_area.dart'
    as gsa;
import 'package:safestreets/app/domain/usecases/subscribe_area_notification.dart'
    as sna;
import 'package:safestreets/app/domain/usecases/unsubscribe_area_notification.dart'
    as uan;
import 'package:safestreets/core/error/failures.dart';
import './bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, BuiltList<bool>> {
  final gsa.GetSubscriptionArea getSubscriptionArea;
  final sna.SubscribeAreaNotification subscribeAreaNotification;
  final uan.UnsubscribeAreaNotification unsubscribeAreaNotification;
  final UserBloc userBloc;
  StreamSubscription userSub;

  NotificationBloc({
    @required this.getSubscriptionArea,
    @required this.subscribeAreaNotification,
    @required this.unsubscribeAreaNotification,
    @required this.userBloc,
  }) {
    userSub = userBloc.listen((userState) {
      if (userState is LoggedUserState) {
        add(
          InitalizeNotificationEvent(),
        );
      }
    });
  }

  @override
  BuiltList<bool> get initialState => BuiltList<bool>(
        [
          false,
          false,
          false,
        ],
      );

  @override
  Stream<BuiltList<bool>> mapEventToState(
    NotificationEvent event,
  ) async* {
    yield* event.when(
      initalizeNotificationEvent: (e) => _mapInitializeNotificationEvent(e),
      updateNotificationEvent: (e) => _mapUpdateNotificationEvent(e),
    );
  }

  Stream<BuiltList<bool>> _mapUpdateNotificationEvent(
      UpdateNotificationEvent event) async* {
    Either<Failure, void> failOrSub;

    if (event.newValue) {
      failOrSub = await subscribeAreaNotification(
        sna.Params(
          areaID: event.indexChange == 0
              ? AREA_1_SHARED_PREF
              : event.indexChange == 1
                  ? AREA_2_SHARED_PREF
                  : AREA_3_SHARED_PREF,
        ),
      );
    } else {
      failOrSub = await unsubscribeAreaNotification(
        uan.Params(
          areaID: event.indexChange == 0
              ? AREA_1_SHARED_PREF
              : event.indexChange == 1
                  ? AREA_2_SHARED_PREF
                  : AREA_3_SHARED_PREF,
        ),
      );
    }

    yield* failOrSub.fold(
      (failure) async* {},
      (_) async* {
        yield state.rebuild(
          (l) => l[event.indexChange] = event.newValue,
        );
      },
    );
  }

  Stream<BuiltList<bool>> _mapInitializeNotificationEvent(
      InitalizeNotificationEvent event) async* {
    final area1Status = await getSubscriptionArea(
      gsa.Params(
        areaID: AREA_1_SHARED_PREF,
      ),
    );
    final area2Status = await getSubscriptionArea(
      gsa.Params(
        areaID: AREA_2_SHARED_PREF,
      ),
    );
    final area3Status = await getSubscriptionArea(
      gsa.Params(
        areaID: AREA_3_SHARED_PREF,
      ),
    );

    yield BuiltList<bool>(
      [
        area1Status,
        area2Status,
        area3Status,
      ],
    );
  }

  @override
  Future<void> close() {
    userSub.cancel();
    return super.close();
  }
}
