import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/community.dart';

abstract class CommunityRemoteDataSource {
  Future<Community> createCommunity(Community community);
  Future<Community?> getCurrentUserCommunity();
  Future<Community?> getCommunityByCode(String communityCode);
}

@LazySingleton(as: CommunityRemoteDataSource)
class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  CommunityRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  String _generateCommunityCode(String documentId) {
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final bytes = utf8.encode(documentId);

    // Pure deterministic 6-character string from documentId bytes
    int hash1 = 5381;
    int hash2 = 0;
    for (final b in bytes) {
      hash1 = ((hash1 << 5) + hash1) ^ b;
      hash2 = ((hash2 << 7) + hash2) ^ b;
    }

    final code = StringBuffer();
    var val1 = hash1.abs();
    var val2 = hash2.abs();

    for (var i = 0; i < 3; i++) {
      code.write(chars[val1 % chars.length]);
      val1 = (val1 / chars.length).floor();
    }
    for (var i = 0; i < 3; i++) {
      code.write(chars[val2 % chars.length]);
      val2 = (val2 / chars.length).floor();
    }

    return code.toString().padRight(6, 'X').substring(0, 6);
  }

  @override
  Future<Community> createCommunity(Community community) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('User must be authenticated to create a community');
      }

      final docRef = _firestore.collection('communities').doc();
      final now = DateTime.now();
      final communityCode = _generateCommunityCode(docRef.id);

      final fullCommunity = community.copyWith(
        id: docRef.id,
        communityCode: communityCode,
        createdBy: user.uid,
        createdAt: now,
        updatedAt: now,
      );

      final jsonMap = fullCommunity.toJson();
      jsonMap['createdAt'] = Timestamp.fromDate(now);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.set(jsonMap);

      await _firestore.collection('users').doc(user.uid).update({
        'communityId': docRef.id,
        'onboardingState': 'COMMUNITY_CREATED',
        'updatedAt': Timestamp.fromDate(now),
      });

      return fullCommunity;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Community?> getCurrentUserCommunity() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return null;

      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (!userDoc.exists || userDoc.data() == null) return null;

      final communityId = userDoc.data()!['communityId'] as String?;
      if (communityId == null || communityId.isEmpty) return null;

      final communityDoc =
          await _firestore.collection('communities').doc(communityId).get();
      if (!communityDoc.exists || communityDoc.data() == null) return null;

      final data = communityDoc.data()!;
      _convertTimestamps(data);

      return Community.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Community?> getCommunityByCode(String communityCode) async {
    try {
      final querySnapshot = await _firestore
          .collection('communities')
          .where('communityCode', isEqualTo: communityCode.toUpperCase().trim())
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) return null;

      final data = querySnapshot.docs.first.data();
      _convertTimestamps(data);

      return Community.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  void _convertTimestamps(Map<String, dynamic> data) {
    if (data['createdAt'] is Timestamp) {
      data['createdAt'] = (data['createdAt'] as Timestamp)
          .toDate()
          .toIso8601String();
    }
    if (data['updatedAt'] is Timestamp) {
      data['updatedAt'] = (data['updatedAt'] as Timestamp)
          .toDate()
          .toIso8601String();
    }
  }
}
