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
      await _firestore.collection('users').doc(currentUserId).update({
        'notificationDevices': FieldValue.arrayUnion([device.toJson()]),
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeNotificationDevice(String deviceId, String userId) async {
    try {
      // TODO: Impl remove here
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
