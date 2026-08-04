import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ganesh_chanda/core/services/app_notification_channels.dart';
import 'package:ganesh_chanda/core/utils/check_platforms.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

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
      for (final channel in AppNotificationChannels.allChannels) {
        await androidPlugin.createNotificationChannel(channel);
      }
      log(
        'Android Notification Channels created from AppNotificationChannels.',
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
    final channel = AppNotificationChannels.generalChannel;
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.max,
      playSound: channel.playSound,
    );
    const iosDetails = DarwinNotificationDetails();
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
    final channel = AppNotificationChannels.festivalChannel;
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.max,
      playSound: channel.playSound,
    );
    const iosDetails = DarwinNotificationDetails();
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
    final channel = AppNotificationChannels.eventsChannel;
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.max,
      playSound: channel.playSound,
    );
    const iosDetails = DarwinNotificationDetails();
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
    final channel = AppNotificationChannels.donationsChannel;
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.max,
      playSound: channel.playSound,
    );
    const iosDetails = DarwinNotificationDetails();
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
    final channel = AppNotificationChannels.volunteersChannel;
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.max,
      playSound: channel.playSound,
    );
    const iosDetails = DarwinNotificationDetails();
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
