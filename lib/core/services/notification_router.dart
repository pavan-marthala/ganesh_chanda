import 'dart:async';
import 'dart:developer';

import 'package:ganesh_chanda/core/services/notification_presenter.dart';
import 'package:ganesh_chanda/core/services/notification_service.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/features/shared/models/app_notification.dart';
import 'package:ganesh_chanda/main.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NotificationRouter {
  final NotificationService _notificationService;
  final NotificationPresenter _notificationPresenter;
  StreamSubscription<AppNotification>? _notificationSubscription;
  StreamSubscription<AppNotification>? _tapSubscription;

  NotificationRouter(this._notificationService, this._notificationPresenter);

  void start() {
    _notificationSubscription?.cancel();
    _notificationSubscription = _notificationService.onNotification.listen(
      route,
    );

    _tapSubscription?.cancel();
    _tapSubscription = _notificationService.onTapNotification.listen((payload) {
      log(
        'Notification tapped by user: ${payload.id}',
        name: "NotificationRouter",
      );
      handleTapNavigation(payload);
    });

    log('NotificationRouter started listening to streams.');
  }

  void route(AppNotification payload) {
    log('[NotificationRouter] Processing route for type: ${payload.type.name}');

    switch (payload.type) {
      case NotificationType.general:
        _notificationPresenter.showGeneralNotification(
          id: payload.id,
          title: payload.title,
          body: payload.message,
          payloadData: payload.data,
        );
        break;
      case NotificationType.donationGoalReached:
      case NotificationType.donationReceived:
      case NotificationType.expenseAdded:
        _notificationPresenter.showDonationNotification(
          id: payload.id,
          title: payload.title,
          body: payload.message,
          payloadData: payload.data,
        );
        break;
      case NotificationType.eventCreated:
      case NotificationType.eventStarting:
      case NotificationType.eventUpdated:
        _notificationPresenter.showEventNotification(
          id: payload.id,
          title: payload.title,
          body: payload.message,
          payloadData: payload.data,
        );
        break;
      case NotificationType.volunteerInvitation:
      case NotificationType.volunteerAssigned:
      case NotificationType.volunteerRemoved:
        _notificationPresenter.showVolunteerNotification(
          id: payload.id,
          title: payload.title,
          body: payload.message,
          payloadData: payload.data,
        );
        break;
      case NotificationType.festivalCompleted:
      case NotificationType.festivalStarted:
        _notificationPresenter.showFestivalNotification(
          id: payload.id,
          title: payload.title,
          body: payload.message,
          payloadData: payload.data,
        );
        break;
    }
  }

  void handleTapNavigation(AppNotification payload) {
    log(
      '[NotificationRouter] Handling tap navigation for payload type: ${payload.type.name}',
    );
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      log('[NotificationRouter] Navigation skipped: Root Context is null.');
      return;
    }

    switch (payload.type) {
      case NotificationType.expenseAdded:
      case NotificationType.eventUpdated:
      case NotificationType.eventStarting:
      case NotificationType.eventCreated:
      case NotificationType.festivalStarted:
      case NotificationType.festivalCompleted:
      case NotificationType.donationReceived:
      case NotificationType.donationGoalReached:
        final id = payload.data["festivalId"] as String?;
        if (id != null) {
          context.go(AppRoutes.festivalsHome);
        } else {
          context.go(AppRoutes.dashboard, extra: id);
        }
        break;
      case NotificationType.general:
      case NotificationType.volunteerAssigned:
      case NotificationType.volunteerRemoved:
      case NotificationType.volunteerInvitation:
        context.go(AppRoutes.festivalsHome);
        break;
    }
  }
}
