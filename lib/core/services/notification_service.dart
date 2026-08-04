import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ganesh_chanda/core/utils/check_platforms.dart';
import 'package:ganesh_chanda/features/shared/models/app_notification.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ganesh_chanda/core/services/web_notification_helper.dart'
    if (dart.library.html) 'package:ganesh_chanda/core/services/web_notification_helper_web.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(
    'Handling background message: ${message.messageId}',
    name: "PUSH-ANDROID",
  );

  if (message.notification != null) {
    log(
      'Skipping local display: message has native notification payload.',
      name: "PUSH-ANDROID",
    );
    return;
  }

  try {
    final localNotifications = FlutterLocalNotificationsPlugin();
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await localNotifications.initialize(settings: initSettings);

    final data = message.data;
    final id =
        message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();
    final title = data['title'] as String? ?? 'VanishLink';
    final body = data['body'] as String? ?? '';

    final String channelId;
    final String channelName;
    final String channelDesc;

    final type = data['type'] as String? ?? 'system';
    if (type == 'newMessage' || type == 'mention') {
      channelId = 'chat_notifications_v2';
      channelName = 'Chat Messages';
      channelDesc = 'Direct messages and mentions';
    } else if (type == 'missedCall') {
      channelId = 'missed_call_notifications_v2';
      channelName = 'Missed Calls';
      channelDesc = 'Missed call notifications';
    } else {
      channelId = 'system_notifications_v2';
      channelName = 'System Alerts';
      channelDesc = 'Administrative and service alerts';
    }

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDesc,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await localNotifications.show(
      id: id.hashCode,
      title: title,
      body: body,
      notificationDetails: details,
      payload: id,
    );
    log(
      'Local background notification shown successfully for data-only message.',
      name: "PUSH-ANDROID",
    );
  } catch (e) {
    log(
      'Error displaying local background notification: $e',
      name: "PUSH-ANDROID",
    );
  }
}

@LazySingleton()
class NotificationService {
  final FirebaseMessaging _fcm;
  final StreamController<AppNotification> _notificationStreamController =
      StreamController<AppNotification>.broadcast();
  final StreamController<AppNotification> _tapStreamController =
      StreamController<AppNotification>.broadcast();

  NotificationService(this._fcm);

  Stream<AppNotification> get onNotification =>
      _notificationStreamController.stream;
  Stream<AppNotification> get onTapNotification => _tapStreamController.stream;

  bool _isInitialized = false;

  /// Exposes current notification permission status.
  Future<bool> get hasNotificationPermission async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    log(
      'Initializing Notification Stack (Web support enabled)...',
      name: "NotificationService",
    );

    // Setup web SW tapped listeners if on Web
    if (PlatformChecker.isWeb()) {
      setupWebNotificationListener(_tapStreamController);
      log(
        'Registered Web SW message event listener.',
        name: "NotificationService",
      );
    }

    // Request permissions dynamically
    await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Fetch token for diagnostics
    try {
      final token = await _fcm.getToken();
      log('FCM Token retrieved successfully: $token', name: "PUSH-Token");
    } catch (e) {
      log('Diagnostics error fetching token: $e', name: "PUSH-Token");
    }

    // Foreground listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Foreground message received: ${message.messageId}');
      final payload = _parseRemoteMessage(message);
      _notificationStreamController.add(payload);
    });

    // Background tap listener (App was in background but still running)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message opened app from background: ${message.messageId}');
      final payload = _parseRemoteMessage(message);
      _tapStreamController.add(payload);
    });

    // Terminated launch scenario (App was completely closed)
    if (!PlatformChecker.isWeb()) {
      final initialMessage = await _fcm.getInitialMessage();
      if (initialMessage != null) {
        log(
          'App launched from terminated state via initial message: ${initialMessage.messageId}',
        );
        final payload = _parseRemoteMessage(initialMessage);
        // Wait a short delay so listeners have registered
        Future.delayed(const Duration(milliseconds: 500), () {
          _tapStreamController.add(payload);
        });
      }
    }

    _isInitialized = true;
    log('NotificationService initialized successfully.');
  }

  AppNotification _parseRemoteMessage(RemoteMessage message) {
    final data = message.data;
    final id =
        message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();
    final title =
        message.notification?.title ??
        data['title'] as String? ??
        'Ganesh Chanda';
    final body = message.notification?.body ?? data['body'] as String? ?? '';

    // Extract structure from raw FCM data payload
    return AppNotification(
      id: id,
      type: _parseType(data['type'] as String?),
      title: title,
      message: body,
      referenceId: data['referenceId'] as String? ?? "",
      userId: data['receiverId'] as String? ?? "",
      referenceType: _parseReferenceType(data['referenceType'] as String?),
      createdAt: DateTime.now(),
    );
  }

  NotificationType _parseType(String? value) {
    switch (value) {
      case 'volunteerInvitation':
        return NotificationType.volunteerInvitation;

      case 'volunteerAssigned':
        return NotificationType.volunteerAssigned;

      case 'volunteerRemoved':
        return NotificationType.volunteerRemoved;

      case 'donationReceived':
        return NotificationType.donationReceived;

      case 'donationGoalReached':
        return NotificationType.donationGoalReached;

      case 'expenseAdded':
        return NotificationType.expenseAdded;

      case 'eventCreated':
        return NotificationType.eventCreated;

      case 'eventUpdated':
        return NotificationType.eventUpdated;

      case 'eventStarting':
        return NotificationType.eventStarting;

      case 'festivalStarted':
        return NotificationType.festivalStarted;

      case 'festivalCompleted':
        return NotificationType.festivalCompleted;

      case 'general':
      default:
        return NotificationType.general;
    }
  }

  NotificationReferenceType _parseReferenceType(String? value) {
    switch (value) {
      case 'community':
        return NotificationReferenceType.community;

      case 'festival':
        return NotificationReferenceType.festival;

      case 'event':
        return NotificationReferenceType.event;

      case 'donation':
        return NotificationReferenceType.donation;

      case 'expense':
        return NotificationReferenceType.expense;

      case 'volunteer':
        return NotificationReferenceType.volunteer;

      case 'none':
      default:
        return NotificationReferenceType.none;
    }
  }

  void dispose() {
    _notificationStreamController.close();
    _tapStreamController.close();
  }
}
