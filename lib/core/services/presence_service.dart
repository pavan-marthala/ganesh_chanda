import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ganesh_chanda/core/utils/check_platforms.dart';
import 'package:ganesh_chanda/core/utils/device_identifier_provider.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PresenceService {
  final DeviceIdentifierProvider _deviceIdentifierProvider;
  final FirebaseAuth _auth;
  StreamSubscription<User?>? _authSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;
  String? _currentUserId;
  PresenceService(this._deviceIdentifierProvider, this._auth);

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

      // Track token refresh events
      _tokenRefreshSubscription?.cancel();
      _tokenRefreshSubscription = messaging.onTokenRefresh.listen((
        newToken,
      ) async {
        if (_currentUserId == uid) {}
      });
    } catch (e) {
      log('Error registering device push token: $e');
    }
  }
}
