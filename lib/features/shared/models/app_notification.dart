import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';
part 'app_notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    @Default('') String id,

    /// Receiver
    @Default('') String userId,

    /// Notification Type
    @Default(NotificationType.general) NotificationType type,

    /// Deep Link Target
    @Default(NotificationReferenceType.none)
    NotificationReferenceType referenceType,

    /// Target document id
    @Default('') String referenceId,

    /// UI
    @Default('') String title,
    @Default('') String message,

    /// Read Status
    @Default(false) bool isRead,
    @Default({}) Map<String, dynamic> data,

    /// Audit
    DateTime? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

enum NotificationType {
  volunteerInvitation,
  volunteerAssigned,
  volunteerRemoved,

  donationReceived,
  donationGoalReached,

  expenseAdded,

  eventCreated,
  eventUpdated,
  eventStarting,

  festivalStarted,
  festivalCompleted,

  general,
}

enum NotificationReferenceType {
  none,

  community,
  festival,
  event,

  donation,
  expense,

  volunteer,
}
