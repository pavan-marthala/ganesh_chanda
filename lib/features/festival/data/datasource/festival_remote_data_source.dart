import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/festival.dart';

abstract class FestivalRemoteDataSource {
  Future<Festival> createFestival(Festival festival);
  Future<Festival?> getCurrentCommunityFestival(String communityId);
  Future<List<Festival>> getCommunityFestivals(String communityId);
}

@LazySingleton(as: FestivalRemoteDataSource)
class FestivalRemoteDataSourceImpl implements FestivalRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  FestivalRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  @override
  Future<Festival> createFestival(Festival festival) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User must be authenticated to create a festival');
    }

    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    if (!userDoc.exists || userDoc.data() == null) {
      throw Exception('User data not found');
    }

    final communityId = userDoc.data()!['communityId'] as String?;
    if (communityId == null || communityId.isEmpty) {
      throw Exception('User is not associated with any community');
    }

    final docRef = _firestore.collection('festivals').doc();
    final now = DateTime.now();

    final fullFestival = festival.copyWith(
      id: docRef.id,
      communityId: communityId,
      createdBy: user.uid,
      createdAt: now,
      updatedAt: now,
    );

    final jsonMap = fullFestival.toJson();
    jsonMap['startDate'] = Timestamp.fromDate(festival.startDate);
    jsonMap['endDate'] = Timestamp.fromDate(festival.endDate);
    jsonMap['createdAt'] = Timestamp.fromDate(now);
    jsonMap['updatedAt'] = Timestamp.fromDate(now);

    await docRef.set(jsonMap);

    return fullFestival;
  }

  @override
  Future<Festival?> getCurrentCommunityFestival(String communityId) async {

    final querySnapshot = await _firestore
        .collection('festivals')
        .where('communityId', isEqualTo: communityId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) return null;

    final data = querySnapshot.docs.first.data();
    if (data['startDate'] is Timestamp) {
      data['startDate'] = (data['startDate'] as Timestamp)
          .toDate()
          .toIso8601String();
    }
    if (data['endDate'] is Timestamp) {
      data['endDate'] = (data['endDate'] as Timestamp)
          .toDate()
          .toIso8601String();
    }
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

    return Festival.fromJson(data);
  }

  @override
  Future<List<Festival>> getCommunityFestivals(String communityId) async {
    final querySnapshot = await _firestore
        .collection('festivals')
        .where('communityId', isEqualTo: communityId)
        .orderBy('createdAt', descending: true)
        .get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data();

      if (data['startDate'] is Timestamp) {
        data['startDate'] = (data['startDate'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      if (data['endDate'] is Timestamp) {
        data['endDate'] = (data['endDate'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
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

      return Festival.fromJson(data);
    }).toList();
  }
}
