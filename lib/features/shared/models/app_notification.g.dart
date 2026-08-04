// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      type:
          $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.general,
      referenceType:
          $enumDecodeNullable(
            _$NotificationReferenceTypeEnumMap,
            json['referenceType'],
          ) ??
          NotificationReferenceType.none,
      referenceId: json['referenceId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['isRead'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AppNotificationToJson(
  _AppNotification instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'referenceType': _$NotificationReferenceTypeEnumMap[instance.referenceType]!,
  'referenceId': instance.referenceId,
  'title': instance.title,
  'message': instance.message,
  'isRead': instance.isRead,
  'data': instance.data,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$NotificationTypeEnumMap = {
  NotificationType.volunteerInvitation: 'volunteerInvitation',
  NotificationType.volunteerAssigned: 'volunteerAssigned',
  NotificationType.volunteerRemoved: 'volunteerRemoved',
  NotificationType.donationReceived: 'donationReceived',
  NotificationType.donationGoalReached: 'donationGoalReached',
  NotificationType.expenseAdded: 'expenseAdded',
  NotificationType.eventCreated: 'eventCreated',
  NotificationType.eventUpdated: 'eventUpdated',
  NotificationType.eventStarting: 'eventStarting',
  NotificationType.festivalStarted: 'festivalStarted',
  NotificationType.festivalCompleted: 'festivalCompleted',
  NotificationType.general: 'general',
};

const _$NotificationReferenceTypeEnumMap = {
  NotificationReferenceType.none: 'none',
  NotificationReferenceType.community: 'community',
  NotificationReferenceType.festival: 'festival',
  NotificationReferenceType.event: 'event',
  NotificationReferenceType.donation: 'donation',
  NotificationReferenceType.expense: 'expense',
  NotificationReferenceType.volunteer: 'volunteer',
};
