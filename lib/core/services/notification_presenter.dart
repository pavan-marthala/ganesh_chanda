import 'dart:developer';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ganesh_chanda/core/utils/check_platforms.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NotificationPresenter {
  final FlutterLocalNotificationsPlugin _localNotifications;
  bool _isInitialized = false;

  NotificationPresenter(this._localNotifications);
  Future<void> initialize() async {
    if (PlatformChecker.isWeb()) return;
    if (_isInitialized) return;

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

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create Android channels
    await _createNotificationChannels();

    _isInitialized = true;
    log(
      'NotificationPresenter initialized successfully.',
      name: "NotificationPresenter",
    );
  }

  Future<void> _createNotificationChannels() async {
    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      const generalChannel = AndroidNotificationChannel(
        'general',
        'General Notifications',
        description:
            'General announcements, app updates, informational messages',
        importance: Importance.max,
        playSound: true,
      );

      // 2. System notifications channel
      const festivalChannel = AndroidNotificationChannel(
        'festival',
        'Festival Updates',
        description:
            'Festival started, Festival completed, major festival updates',
        importance: Importance.max,
        playSound: true,
      );
      const eventCallChannel = AndroidNotificationChannel(
        'events',
        'Event Notifications',
        description: 'Event starting, Event updated, Event reminders',
        importance: Importance.max,
        playSound: true,
      );
      const donationsChannel = AndroidNotificationChannel(
        'donations',
        'Donation Updates',
        description:
            'Donation received, donation acknowledgements, goal reached',
        importance: Importance.max,
        playSound: true,
      );
      const volunteersChannel = AndroidNotificationChannel(
        'volunteers',
        'Volunteer Updates',
        description:
            'Volunteer invitations, assignments, removals, important volunteer updates',
        importance: Importance.max,
        playSound: true,
      );

      await androidPlugin.createNotificationChannel(generalChannel);
      await androidPlugin.createNotificationChannel(festivalChannel);
      await androidPlugin.createNotificationChannel(eventCallChannel);
      await androidPlugin.createNotificationChannel(donationsChannel);
      await androidPlugin.createNotificationChannel(volunteersChannel);
      log(
        'Android Notification Channels (v2) created.',
        name: "NotificationPresenter",
      );
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    log(
      'Local notification tapped: ${response.payload}',
      name: "NotificationPresenter",
    );
  }

  Future<bool> _checkPermission() async {
    final granted = await Permission.notification.isGranted;
    log('Checked permission status: $granted');
    if (!granted) {
      log(
        'Skip display: notification permission denied.',
        name: "NotificationPresenter",
      );
    }
    return granted;
  }

  Future<void> showGeneralNotification({
    required String id,
    required String title,
    required String body,
    required Map<String, dynamic> payloadData,
  }) async {
    if (PlatformChecker.isWeb()) return;
    if (!await _checkPermission()) return;

    log('Showing general notification: $id', name: "NotificationPresenter");
    final androidDetails = AndroidNotificationDetails(
      'general',
      'General Notifications',
      channelDescription:
          'General announcements, app updates, informational messages',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      id: id.hashCode,
      title: title,
      body: body,
      notificationDetails: details,
      payload: id,
    );
  }

  Future<void> showFestivalNotification({
    required String id,
    required String title,
    required String body,
    required Map<String, dynamic> payloadData,
  }) async {
    if (PlatformChecker.isWeb()) return;
    if (!await _checkPermission()) return;
    log('Showing festival notification: $id', name: "NotificationPresenter");
    final androidDetails = AndroidNotificationDetails(
      'festival',
      'Festival Updates',
      channelDescription:
          'Festival started, Festival completed, major festival updates',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _localNotifications.show(
      id: id.hashCode,
      title: title,
      body: body,
      notificationDetails: details,
      payload: id,
    );
  }

  Future<void> showEventNotification({
    required String id,
    required String title,
    required String body,
    required Map<String, dynamic> payloadData,
  }) async {
    if (PlatformChecker.isWeb()) return;
    if (!await _checkPermission()) return;

    log('Showing event notification: $id', name: "NotificationPresenter");
    final androidDetails = AndroidNotificationDetails(
      'events',
      'Event Notifications',
      channelDescription: 'Event starting, Event updated, Event reminders',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _localNotifications.show(
      id: id.hashCode,
      title: title,
      body: body,
      notificationDetails: details,
      payload: id,
    );
  }

  Future<void> showDonationNotification({
    required String id,
    required String title,
    required String body,
    required Map<String, dynamic> payloadData,
  }) async {
    if (PlatformChecker.isWeb()) return;
    if (!await _checkPermission()) return;
    log('Showing donation notification: $id', name: "NotificationPresenter");
    final androidDetails = AndroidNotificationDetails(
      'donations',
      'Donation Updates',
      channelDescription:
          'Donation received, donation acknowledgements, goal reached',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _localNotifications.show(
      id: id.hashCode,
      title: title,
      body: body,
      notificationDetails: details,
      payload: id,
    );
  }

  Future<void> showVolunteerNotification({
    required String id,
    required String title,
    required String body,
    required Map<String, dynamic> payloadData,
  }) async {
    if (PlatformChecker.isWeb()) return;
    if (!await _checkPermission()) return;
    log('Showing volunteer notification: $id', name: "NotificationPresenter");
    final androidDetails = AndroidNotificationDetails(
      'volunteers',
      'Volunteer Updates',
      channelDescription:
          'Volunteer invitations, assignments, removals, important volunteer updates',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _localNotifications.show(
      id: id.hashCode,
      title: title,
      body: body,
      notificationDetails: details,
      payload: id,
    );
  }
}
