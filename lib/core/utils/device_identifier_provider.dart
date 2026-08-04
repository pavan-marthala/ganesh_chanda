import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

abstract class DeviceIdentifierProvider {
  Future<String> getIdentifier();
  Future<DevicePlatform> getPlatform();
  Future<String> getDeviceName();
}

@LazySingleton(as: DeviceIdentifierProvider)
class DeviceIdentifierProviderImpl implements DeviceIdentifierProvider {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  @override
  Future<String> getIdentifier() async {
    String rawId;
    if (kIsWeb) {
      rawId = await _getOrGeneratePersistentUuid();
    } else {
      try {
        if (Platform.isAndroid) {
          final androidInfo = await _deviceInfo.androidInfo;
          rawId = androidInfo.id;
        } else if (Platform.isIOS) {
          final iosInfo = await _deviceInfo.iosInfo;
          rawId =
              iosInfo.identifierForVendor ??
              await _getOrGeneratePersistentUuid();
        } else {
          rawId = await _getOrGeneratePersistentUuid();
        }
      } catch (_) {
        rawId = await _getOrGeneratePersistentUuid();
      }
    }

    // Sanitize ID for Firebase RTDB keys (remove/replace '.', '#', '$', '/', '[', ']')
    return rawId.replaceAll(RegExp(r'[\.\#\$\/\[\]]'), '_');
  }

  @override
  Future<DevicePlatform> getPlatform() async {
    if (kIsWeb) return .web;
    try {
      if (Platform.isAndroid) return .android;
      if (Platform.isIOS) return .ios;
      if (Platform.isWindows) return .windows;
      if (Platform.isMacOS) return .macos;
      if (Platform.isLinux) return .linux;
      return .other;
    } catch (_) {
      return .other;
    }
  }

  Future<String> _getOrGeneratePersistentUuid() async {
    final storage = FlutterSecureStorage();
    const key = 'vanish_link_persistent_device_id';
    var cachedId = await storage.read(key: key);
    if (cachedId == null) {
      cachedId = const Uuid().v4();
      await storage.write(key: key, value: cachedId);
    }
    return cachedId;
  }

  @override
  Future<String> getDeviceName() async {
    String name;
    if (kIsWeb) {
      name = "Web";
    } else {
      try {
        if (Platform.isAndroid) {
          final androidInfo = await _deviceInfo.androidInfo;
          name = androidInfo.name;
        } else if (Platform.isIOS) {
          final iosInfo = await _deviceInfo.iosInfo;
          name = iosInfo.name;
        } else if (Platform.isMacOS) {
          final iosInfo = await _deviceInfo.macOsInfo;
          name = iosInfo.computerName;
        } else if (Platform.isWindows) {
          final iosInfo = await _deviceInfo.windowsInfo;
          name = iosInfo.computerName;
        } else {
          name = "Unknown";
        }
      } catch (_) {
        name = "Unknown";
      }
    }
    return name;
  }
}
