import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/festival.dart';

abstract class FestivalRemoteDataSource {
  Future<Festival> createFestival(Festival festival);
  Future<Festival?> getFestivalById(String festivalId);
  Future<List<Festival>> getCommunityFestivals(String communityId);
  Future<Festival> updateFestival(Festival festival);
  Future<void> deleteFestival(String festivalId);
  Future<void> assignVolunteer({
    required String festivalId,
    required String volunteerId,
  });
  Future<void> removeVolunteer({
    required String festivalId,
    required String volunteerId,
  });
}

@LazySingleton(as: FestivalRemoteDataSource)
class FestivalRemoteDataSourceImpl implements FestivalRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  FestivalRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  @override
  Future<Festival> createFestival(Festival festival) async {
    try {
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
        totalDonationAmount: 0.0,
        totalDonationCount: 0,
        totalExpenseAmount: 0.0,
        totalExpenseCount: 0,
        totalVolunteerCount: 0,
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
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Festival?> getFestivalById(String festivalId) async {
    try {
      final docSnapshot =
          await _firestore.collection('festivals').doc(festivalId).get();

      if (!docSnapshot.exists || docSnapshot.data() == null) return null;

      final data = docSnapshot.data()!;
      _convertTimestamps(data);

      return Festival.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Festival>> getCommunityFestivals(String communityId) async {
    try {
      final querySnapshot = await _firestore
          .collection('festivals')
          .where('communityId', isEqualTo: communityId)
          .orderBy('createdAt', descending: true)
          .get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Festival.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Festival> updateFestival(Festival festival) async {
    try {
      final docRef = _firestore.collection('festivals').doc(festival.id);
      final now = DateTime.now();
      final updatedFestival = festival.copyWith(updatedAt: now);

      final jsonMap = updatedFestival.toJson();
      jsonMap['startDate'] = Timestamp.fromDate(updatedFestival.startDate);
      jsonMap['endDate'] = Timestamp.fromDate(updatedFestival.endDate);
      jsonMap['createdAt'] = Timestamp.fromDate(updatedFestival.createdAt);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.update(jsonMap);
      return updatedFestival;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFestival(String festivalId) async {
    try {
      await _firestore.collection('festivals').doc(festivalId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> assignVolunteer({
    required String festivalId,
    required String volunteerId,
  }) async {
    try {
      final docRef = _firestore.collection('festivals').doc(festivalId);
      await docRef.update({
        'assignedVolunteerIds': FieldValue.arrayUnion([volunteerId]),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeVolunteer({
    required String festivalId,
    required String volunteerId,
  }) async {
    try {
      final docRef = _firestore.collection('festivals').doc(festivalId);
      await docRef.update({
        'assignedVolunteerIds': FieldValue.arrayRemove([volunteerId]),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      rethrow;
    }
  }

  void _convertTimestamps(Map<String, dynamic> data) {
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
  }
}
