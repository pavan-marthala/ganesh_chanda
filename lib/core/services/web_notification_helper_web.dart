// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:developer';
import 'dart:html' as html;
import 'package:ganesh_chanda/features/shared/models/app_notification.dart';

void setupWebNotificationListener(
  StreamController<AppNotification> tapStreamController,
) {
  html.window.addEventListener('message', (html.Event event) {
    if (event is html.MessageEvent) {
      final data = event.data;
      if (data is Map && data['type'] == 'NOTIFICATION_TAP') {
        log(
          'Received NOTIFICATION_TAP message event from SW: $data',
          name: "WebNotificationHelper",
        );
        try {
          final payloadMap = Map<String, dynamic>.from(data['payload'] as Map);
          final payload = AppNotification.fromJson(payloadMap);
          tapStreamController.add(payload);
        } catch (e) {
          log(
            'Error parsing message event payload: $e',
            name: "WebNotificationHelper",
          );
        }
      }
    }
  });
}
