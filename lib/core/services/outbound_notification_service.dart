import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ganesh_chanda/core/services/app_notification_channels.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/community/domain/models/community.dart';
import 'package:ganesh_chanda/features/donation/domain/models/donation.dart';
import 'package:ganesh_chanda/features/event/domain/models/event.dart';
import 'package:ganesh_chanda/features/expense/domain/models/expense.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival.dart';
import 'package:ganesh_chanda/features/shared/models/app_notification.dart';
import 'package:ganesh_chanda/features/shared/models/notification_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OutboundNotificationService {
  final Dio _dio;

  OutboundNotificationService([Dio? dio]) : _dio = dio ?? Dio();

  String get _baseUrl =>
      dotenv.env['NOTIFICATION_API_URL'] ??
      'http://localhost:8080/notifications';

  /// Private helper to extract a clean list of FCM tokens from users.
  List<String> _extractTokens(List<AppUser> users) {
    final tokens = <String>{};
    for (final user in users) {
      for (final device in user.notificationDevices) {
        if (device.isActive && device.token.trim().isNotEmpty) {
          tokens.add(device.token.trim());
        }
      }
    }
    return tokens.toList();
  }

  /// Sends a NotificationRequest to the backend Spring Boot API using Dio.
  Future<void> _sendNotificationApi(NotificationRequest request) async {
    if (request.tokens.isEmpty) {
      log(
        'Skipping notification send: token list is empty.',
        name: 'OutboundNotificationService',
      );
      return;
    }

    try {
      final response = await _dio.post(
        _baseUrl,
        data: request.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
        log(
          'Notification request sent successfully to backend (${response.statusCode})',
          name: 'OutboundNotificationService',
        );
      } else {
        log(
          'Failed to send notification request. Status: ${response.statusCode}, Data: ${response.data}',
          name: 'OutboundNotificationService',
        );
      }
    } catch (e, stack) {
      log(
        'Error invoking notification API: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }

  /// 1. Volunteer Added - Notifies Community Admins
  Future<void> sendVolunteerAdded({
    required AppUser volunteer,
    required Community community,
    required List<AppUser> admins,
  }) async {
    try {
      final tokens = _extractTokens(admins);
      final volunteerName =
          volunteer.displayName.isNotEmpty ? volunteer.displayName : 'A new volunteer';
      final communityName =
          community.name.isNotEmpty ? community.name : 'the community';

      final request = NotificationRequest(
        title: 'New Volunteer Joined',
        body: '$volunteerName joined $communityName.',
        channelId: AppNotificationChannels.volunteersId,
        tokens: tokens,
        data: {
          'type': NotificationType.volunteerInvitation.name,
          'referenceType': NotificationReferenceType.community.name,
          'referenceId': community.id,
          'volunteerId': volunteer.id,
        },
      );

      await _sendNotificationApi(request);
    } catch (e, stack) {
      log(
        'Error in sendVolunteerAdded: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }

  /// 2. Volunteer Assigned - Notifies Assigned Volunteer
  Future<void> sendVolunteerAssigned({
    required Festival festival,
    required AppUser volunteer,
  }) async {
    try {
      final tokens = _extractTokens([volunteer]);
      final festivalName =
          festival.name.isNotEmpty ? festival.name : 'a festival';

      final request = NotificationRequest(
        title: 'Festival Duty Assigned',
        body: 'You have been assigned as a volunteer for $festivalName.',
        channelId: AppNotificationChannels.volunteersId,
        tokens: tokens,
        data: {
          'type': NotificationType.volunteerAssigned.name,
          'referenceType': NotificationReferenceType.festival.name,
          'referenceId': festival.id,
          'festivalId': festival.id,
        },
      );

      await _sendNotificationApi(request);
    } catch (e, stack) {
      log(
        'Error in sendVolunteerAssigned: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }

  /// 3. Donation Notification - Sends Donation Received & checks Goal Achieved internally
  Future<void> sendDonationNotification({
    required Donation donation,
    required Festival festival,
    required List<AppUser> recipients,
  }) async {
    try {
      final tokens = _extractTokens(recipients);
      final donorName =
          donation.donorName.isNotEmpty ? donation.donorName : 'A donor';
      final festivalName =
          festival.name.isNotEmpty ? festival.name : 'the festival';

      // 1. Send Donation Received Notification
      final donationRequest = NotificationRequest(
        title: 'Donation Received',
        body: '$donorName donated ₹${donation.amount.toStringAsFixed(0)} for $festivalName.',
        channelId: AppNotificationChannels.donationsId,
        tokens: tokens,
        data: {
          'type': NotificationType.donationReceived.name,
          'referenceType': NotificationReferenceType.donation.name,
          'referenceId': donation.id,
          'festivalId': festival.id,
        },
      );

      await _sendNotificationApi(donationRequest);

      // 2. Check Goal Achieved Business Rule:
      // previousTotal < goal AND newTotal >= goal
      final previousTotal = festival.totalDonationAmount;
      final newTotal = previousTotal + donation.amount;
      final goal = festival.goal;

      if (goal > 0 && previousTotal < goal && newTotal >= goal) {
        final goalRequest = NotificationRequest(
          title: 'Donation Goal Reached! 🎉',
          body:
              '$festivalName reached its donation goal of ₹${goal.toStringAsFixed(0)}!',
          channelId: AppNotificationChannels.donationsId,
          tokens: tokens,
          data: {
            'type': NotificationType.donationGoalReached.name,
            'referenceType': NotificationReferenceType.festival.name,
            'referenceId': festival.id,
            'festivalId': festival.id,
          },
        );

        await _sendNotificationApi(goalRequest);
      }
    } catch (e, stack) {
      log(
        'Error in sendDonationNotification: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }

  /// 4. Expense Added - Notifies Community Admins
  Future<void> sendExpenseAdded({
    required Expense expense,
    required Festival festival,
    required List<AppUser> admins,
  }) async {
    try {
      final tokens = _extractTokens(admins);
      final title = expense.title.isNotEmpty ? expense.title : 'An expense';
      final festivalName =
          festival.name.isNotEmpty ? festival.name : 'the festival';

      final request = NotificationRequest(
        title: 'Expense Added',
        body:
            '$title (₹${expense.amount.toStringAsFixed(0)}) added for $festivalName.',
        channelId: AppNotificationChannels.donationsId,
        tokens: tokens,
        data: {
          'type': NotificationType.expenseAdded.name,
          'referenceType': NotificationReferenceType.expense.name,
          'referenceId': expense.id,
          'festivalId': festival.id,
        },
      );

      await _sendNotificationApi(request);
    } catch (e, stack) {
      log(
        'Error in sendExpenseAdded: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }

  /// 5. Festival Updated - Notifies Community Admins & Assigned Volunteers
  Future<void> sendFestivalUpdated({
    required Festival festival,
    required List<AppUser> recipients,
  }) async {
    try {
      final tokens = _extractTokens(recipients);
      final festivalName =
          festival.name.isNotEmpty ? festival.name : 'Festival';

      final request = NotificationRequest(
        title: 'Festival Details Updated',
        body: '$festivalName details have been updated.',
        imageUrl: festival.bannerUrl,
        channelId: AppNotificationChannels.festivalId,
        tokens: tokens,
        data: {
          'type': NotificationType.festivalStarted.name,
          'referenceType': NotificationReferenceType.festival.name,
          'referenceId': festival.id,
          'festivalId': festival.id,
        },
      );

      await _sendNotificationApi(request);
    } catch (e, stack) {
      log(
        'Error in sendFestivalUpdated: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }

  /// 6. Event Created - Notifies Assigned Volunteers
  Future<void> sendEventCreated({
    required Event event,
    required Festival festival,
    required List<AppUser> volunteers,
  }) async {
    try {
      final tokens = _extractTokens(volunteers);
      final eventName = event.name.isNotEmpty ? event.name : 'New Event';
      final festivalName =
          festival.name.isNotEmpty ? festival.name : 'the festival';

      final request = NotificationRequest(
        title: 'New Event Scheduled',
        body: '$eventName has been scheduled for $festivalName.',
        imageUrl: event.bannerUrl,
        channelId: AppNotificationChannels.eventsId,
        tokens: tokens,
        data: {
          'type': NotificationType.eventCreated.name,
          'referenceType': NotificationReferenceType.event.name,
          'referenceId': event.id,
          'festivalId': festival.id,
        },
      );

      await _sendNotificationApi(request);
    } catch (e, stack) {
      log(
        'Error in sendEventCreated: $e',
        error: e,
        stackTrace: stack,
        name: 'OutboundNotificationService',
      );
    }
  }
}
