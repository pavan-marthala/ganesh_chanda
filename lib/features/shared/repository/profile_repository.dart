import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRepository {
  Future<void> updateProfile(String displayName, String photoUrl);
  Future<void> addNotificationDevice(NotificationDevice device);
  Future<void> removeNotificationDevice(String deviceId, String userId);
}

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ProfileRepositoryImpl(this._firestore, this._auth);

  @override
  Future<void> addNotificationDevice(NotificationDevice device) async {
    try {
      final currentUserId = _auth.currentUser?.uid;
      if (currentUserId == null || currentUserId.isEmpty) {
        throw Exception('User is not logged in');
      }

      final userDocRef = _firestore.collection('users').doc(currentUserId);
      final snapshot = await userDocRef.get();

      if (!snapshot.exists) {
        throw Exception('User document does not exist');
      }

      final data = snapshot.data() ?? {};
      final rawDevices = data['notificationDevices'] as List<dynamic>? ?? [];

      final devices = rawDevices
          .map((item) => NotificationDevice.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();

      final existingIndex =
          devices.indexWhere((d) => d.deviceId == device.deviceId);

      if (existingIndex != -1) {
        devices[existingIndex] = device;
      } else {
        devices.add(device);
      }

      final updatedJsonList = devices.map((d) => d.toJson()).toList();

      await userDocRef.update({
        'notificationDevices': updatedJsonList,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeNotificationDevice(String deviceId, String userId) async {
    try {
      final targetUserId =
          userId.isNotEmpty ? userId : _auth.currentUser?.uid;
      if (targetUserId == null || targetUserId.isEmpty) {
        throw Exception('User ID is required to remove device');
      }

      final userDocRef = _firestore.collection('users').doc(targetUserId);
      final snapshot = await userDocRef.get();

      if (!snapshot.exists) {
        return;
      }

      final data = snapshot.data() ?? {};
      final rawDevices = data['notificationDevices'] as List<dynamic>? ?? [];

      final devices = rawDevices
          .map((item) => NotificationDevice.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();

      devices.removeWhere((d) => d.deviceId == deviceId);

      final updatedJsonList = devices.map((d) => d.toJson()).toList();

      await userDocRef.update({
        'notificationDevices': updatedJsonList,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(String displayName, String photoUrl) async {
    try {
      final currentUserId = _auth.currentUser?.uid;
      if (currentUserId == null || currentUserId.isEmpty) {
        throw Exception('User is not logged in');
      }
      await _firestore.collection('users').doc(currentUserId).update({
        'displayName': displayName,
        'photoUrl': photoUrl,
      });
    } catch (e) {
      rethrow;
    }
  }
}
