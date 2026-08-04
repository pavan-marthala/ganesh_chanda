import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ganesh_chanda/core/services/app_notification_channels.dart';
import 'package:ganesh_chanda/core/utils/check_platforms.dart';
import 'package:ganesh_chanda/features/shared/models/app_notification.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ganesh_chanda/core/services/web_notification_helper.dart'
    if (dart.library.html) 'package:ganesh_chanda/core/services/web_notification_helper_web.dart';

FlutterLocalNotificationsPlugin? _bgLocalNotifications;
bool _bgLocalNotificationsInitialized = false;

Future<FlutterLocalNotificationsPlugin> _getBackgroundLocalNotifications() async {
  if (_bgLocalNotifications != null && _bgLocalNotificationsInitialized) {
    return _bgLocalNotifications!;
  }
  _bgLocalNotifications = FlutterLocalNotificationsPlugin();
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const darwinInit = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const initSettings = InitializationSettings(
    android: androidInit,
    iOS: darwinInit,
    macOS: darwinInit,
  );
  await _bgLocalNotifications!.initialize(settings: initSettings);
  _bgLocalNotificationsInitialized = true;
  return _bgLocalNotifications!;
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(
    'Handling background message: ${message.messageId}',
    name: "PUSH-BACKGROUND",
  );

  if (message.notification != null) {
    log(
      'Skipping local display: message has native notification payload.',
      name: "PUSH-BACKGROUND",
    );
    return;
  }

  try {
    final localNotifications = await _getBackgroundLocalNotifications();

    final data = message.data;
    final id =
        message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();
    final title = data['title'] as String? ?? 'Ganesh Chanda';
    final body = data['body'] as String? ?? '';

    final type = data['type'] as String? ?? 'general';
    final AndroidNotificationChannel channel;
    if (type == 'donationReceived' ||
        type == 'donationGoalReached' ||
        type == 'expenseAdded') {
      channel = AppNotificationChannels.donationsChannel;
    } else if (type == 'eventCreated' ||
        type == 'eventStarting' ||
        type == 'eventUpdated') {
      channel = AppNotificationChannels.eventsChannel;
    } else if (type == 'volunteerInvitation' ||
        type == 'volunteerAssigned' ||
        type == 'volunteerRemoved') {
      channel = AppNotificationChannels.volunteersChannel;
    } else if (type == 'festivalStarted' || type == 'festivalCompleted') {
      channel = AppNotificationChannels.festivalChannel;
    } else {
      channel = AppNotificationChannels.generalChannel;
    }

    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.max,
      playSound: channel.playSound,
    );
    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    final details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
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
      name: "PUSH-BACKGROUND",
    );
  } catch (e) {
    log(
      'Error displaying local background notification: $e',
      name: "PUSH-BACKGROUND",
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

  AppNotification? _initialLaunchNotification;
  bool _hasInitialLaunchBeenHandled = false;

  NotificationService(this._fcm);

  Stream<AppNotification> get onNotification =>
      _notificationStreamController.stream;

  Stream<AppNotification> get onTapNotification {
    if (_initialLaunchNotification != null && !_hasInitialLaunchBeenHandled) {
      _hasInitialLaunchBeenHandled = true;
      final initialPayload = _initialLaunchNotification!;
      _initialLaunchNotification = null;

      final controller = StreamController<AppNotification>.broadcast();
      StreamSubscription<AppNotification>? sub;

      controller.onListen = () {
        controller.add(initialPayload);
        sub = _tapStreamController.stream.listen(
          controller.add,
          onError: controller.addError,
          onDone: controller.close,
        );
      };
      controller.onCancel = () {
        sub?.cancel();
      };
      return controller.stream;
    }
    return _tapStreamController.stream;
  }

  bool _isInitialized = false;

  /// Exposes current notification permission status.
  Future<bool> get hasNotificationPermission async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    log(
      'Initializing Notification Stack (iOS/macOS & Web support enabled)...',
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

    // Configure FCM foreground presentation options for Apple (iOS & macOS)
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Request FCM permissions dynamically for all platforms
    final settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    log(
      'FCM Permission Status: ${settings.authorizationStatus}',
      name: "NotificationService",
    );

    // Fetch token for diagnostics
    try {
      final vapidKey =
          PlatformChecker.isWeb() ? dotenv.env['WEB_VAPID_KEY'] : null;
      final token = await _fcm.getToken(
        vapidKey: (vapidKey != null && vapidKey.isNotEmpty) ? vapidKey : null,
      );
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
        _initialLaunchNotification = _parseRemoteMessage(initialMessage);
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

    return AppNotification(
      id: id,
      type: _parseType(data['type'] as String?),
      title: title,
      message: body,
      referenceId: data['referenceId'] as String? ?? "",
      userId: data['receiverId'] as String? ?? "",
      referenceType: _parseReferenceType(data['referenceType'] as String?),
      data: Map<String, dynamic>.from(data),
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
