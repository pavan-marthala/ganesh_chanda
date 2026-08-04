import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ganesh_chanda/core/utils/check_platforms.dart';
import 'package:ganesh_chanda/core/utils/device_identifier_provider.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/shared/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PresenceService {
  final DeviceIdentifierProvider _deviceIdentifierProvider;
  final FirebaseAuth _auth;
  final ProfileRepository _profileRepository;
  StreamSubscription<User?>? _authSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;
  String? _currentUserId;

  PresenceService(
    this._deviceIdentifierProvider,
    this._auth,
    this._profileRepository,
  );

  void start() {
    _authSubscription = _auth.authStateChanges().listen((user) {
      if (user != null) {
        _currentUserId = user.uid;
        _registerDevicePushToken();
      } else {
        if (_currentUserId != null) {
          _tokenRefreshSubscription?.cancel();
          _tokenRefreshSubscription = null;
          _currentUserId = null;
        }
      }
    });
  }

  void stop() {
    _authSubscription?.cancel();
    _authSubscription = null;
    _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }

  Future<void> _registerDevicePushToken() async {
    final uid = _currentUserId;
    if (uid == null) return;
    try {
      final deviceId = await _deviceIdentifierProvider.getIdentifier();
      final platform = await _deviceIdentifierProvider.getPlatform();
      final deviceName = await _deviceIdentifierProvider.getDeviceName();

      final messaging = FirebaseMessaging.instance;
      if (!PlatformChecker.isWeb()) {
        await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      }
      final token = await messaging.getToken();
      if (token != null) {
        log('Token: $token');
        final notificationDetails = NotificationDevice(
          createdAt: DateTime.now(),
          deviceId: deviceId,
          platform: platform,
          isActive: true,
          token: token,
          deviceName: deviceName,
          updatedAt: DateTime.now(),
        );
        await _profileRepository.addNotificationDevice(notificationDetails);
      }

      // Track token refresh events
      _tokenRefreshSubscription?.cancel();
      _tokenRefreshSubscription = messaging.onTokenRefresh.listen((
        newToken,
      ) async {
        if (_currentUserId == uid) {
          log('Token refreshed: $newToken');
          final notificationDetails = NotificationDevice(
            createdAt: DateTime.now(),
            deviceId: deviceId,
            platform: platform,
            isActive: true,
            token: newToken,
            deviceName: deviceName,
            updatedAt: DateTime.now(),
          );
          await _profileRepository.addNotificationDevice(notificationDetails);
        }
      });
    } catch (e) {
      log('Error registering device push token: $e');
    }
  }
}
