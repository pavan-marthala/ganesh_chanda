import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/community.dart';

abstract class CommunityRemoteDataSource {
  Future<Community> createCommunity(Community community);
  Future<Community?> getCurrentUserCommunity();
}

@LazySingleton(as: CommunityRemoteDataSource)
class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  CommunityRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  @override
  Future<Community> createCommunity(Community community) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User must be authenticated to create a community');
    }

    final docRef = _firestore.collection('communities').doc();
    final now = DateTime.now();

    final fullCommunity = community.copyWith(
      id: docRef.id,
      createdBy: user.uid,
      createdAt: now,
      updatedAt: now,
    );

    final jsonMap = fullCommunity.toJson();
    // Convert DateTime fields for Firestore compatibility
    jsonMap['createdAt'] = Timestamp.fromDate(now);
    jsonMap['updatedAt'] = Timestamp.fromDate(now);

    await docRef.set(jsonMap);

    // Also update current user doc with communityId & onboarding state
    await _firestore.collection('users').doc(user.uid).update({
      'communityId': docRef.id,
      'onboardingState': 'COMMUNITY_CREATED',
      'updatedAt': Timestamp.fromDate(now),
    });

    return fullCommunity;
  }

  @override
  Future<Community?> getCurrentUserCommunity() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    if (!userDoc.exists || userDoc.data() == null) return null;

    final communityId = userDoc.data()!['communityId'] as String?;
    if (communityId == null || communityId.isEmpty) return null;

    final communityDoc = await _firestore
        .collection('communities')
        .doc(communityId)
        .get();
    if (!communityDoc.exists || communityDoc.data() == null) return null;

    final data = communityDoc.data()!;
    // Convert Timestamp to ISO String for JsonSerializable parsing
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

    return Community.fromJson(data);
  }
}
