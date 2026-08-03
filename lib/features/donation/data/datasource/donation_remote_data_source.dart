import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/donation.dart';
import '../../domain/enums/donation_status.dart';

abstract class DonationRemoteDataSource {
  Future<Donation> createDonation(Donation donation);
  Future<Donation> updateDonation(Donation donation);
  Future<void> deleteDonation(String donationId);
  Future<Donation?> getDonationById(String donationId);
  Future<List<Donation>> getDonationsByFestival(String festivalId);
  Future<List<Donation>> getDonationsByCommunity(String communityId);
}

@LazySingleton(as: DonationRemoteDataSource)
class DonationRemoteDataSourceImpl implements DonationRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  DonationRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  @override
  Future<Donation> createDonation(Donation donation) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final docRef = _firestore.collection('donations').doc();
      final now = DateTime.now();

      final fullDonation = donation.copyWith(
        id: docRef.id,
        collectedBy: donation.collectedBy.isEmpty
            ? (currentUser?.uid ?? '')
            : donation.collectedBy,
        createdAt: now,
        updatedAt: now,
      );

      final jsonMap = fullDonation.toJson();
      jsonMap['createdAt'] = Timestamp.fromDate(now);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.set(jsonMap);

      // Sync festival summary if donation is received
      if (fullDonation.status == DonationStatus.received) {
        await _updateFestivalSummary(
          festivalId: fullDonation.festivalId,
          amountDelta: fullDonation.amount,
          countDelta: 1,
        );
      }

      return fullDonation;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Donation> updateDonation(Donation donation) async {
    try {
      final docRef = _firestore.collection('donations').doc(donation.id);
      final existingDoc = await docRef.get();

      if (!existingDoc.exists || existingDoc.data() == null) {
        throw Exception('Donation not found');
      }

      final oldData = existingDoc.data()!;
      _convertTimestamps(oldData);
      final oldDonation = Donation.fromJson(oldData);

      final now = DateTime.now();
      final updatedDonation = donation.copyWith(
        updatedAt: now,
      );

      final jsonMap = updatedDonation.toJson();
      jsonMap['createdAt'] = Timestamp.fromDate(donation.createdAt);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.update(jsonMap);

      // Compute delta for festival summary updates
      double oldEffectiveAmount = oldDonation.status == DonationStatus.received
          ? oldDonation.amount
          : 0.0;
      int oldEffectiveCount =
          oldDonation.status == DonationStatus.received ? 1 : 0;

      double newEffectiveAmount =
          updatedDonation.status == DonationStatus.received
              ? updatedDonation.amount
              : 0.0;
      int newEffectiveCount =
          updatedDonation.status == DonationStatus.received ? 1 : 0;

      double amountDelta = newEffectiveAmount - oldEffectiveAmount;
      int countDelta = newEffectiveCount - oldEffectiveCount;

      if (amountDelta != 0 || countDelta != 0) {
        await _updateFestivalSummary(
          festivalId: updatedDonation.festivalId,
          amountDelta: amountDelta,
          countDelta: countDelta,
        );
      }

      return updatedDonation;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteDonation(String donationId) async {
    try {
      final docRef = _firestore.collection('donations').doc(donationId);
      final doc = await docRef.get();

      if (!doc.exists || doc.data() == null) return;

      final data = doc.data()!;
      _convertTimestamps(data);
      final donation = Donation.fromJson(data);

      await docRef.delete();

      if (donation.status == DonationStatus.received) {
        await _updateFestivalSummary(
          festivalId: donation.festivalId,
          amountDelta: -donation.amount,
          countDelta: -1,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Donation?> getDonationById(String donationId) async {
    try {
      final doc =
          await _firestore.collection('donations').doc(donationId).get();
      if (!doc.exists || doc.data() == null) return null;

      final data = doc.data()!;
      _convertTimestamps(data);
      return Donation.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Donation>> getDonationsByFestival(String festivalId) async {
    try {
      final querySnapshot = await _firestore
          .collection('donations')
          .where('festivalId', isEqualTo: festivalId)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Donation.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Donation>> getDonationsByCommunity(String communityId) async {
    try {
      final querySnapshot = await _firestore
          .collection('donations')
          .where('communityId', isEqualTo: communityId)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Donation.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _updateFestivalSummary({
    required String festivalId,
    required double amountDelta,
    required int countDelta,
  }) async {
    if (festivalId.isEmpty) return;
    final festivalRef = _firestore.collection('festivals').doc(festivalId);
    await festivalRef.update({
      'totalDonationAmount': FieldValue.increment(amountDelta),
      'totalDonationCount': FieldValue.increment(countDelta),
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    });
  }

  void _convertTimestamps(Map<String, dynamic> data) {
    if (data['createdAt'] is Timestamp) {
      data['createdAt'] =
          (data['createdAt'] as Timestamp).toDate().toIso8601String();
    }
    if (data['updatedAt'] is Timestamp) {
      data['updatedAt'] =
          (data['updatedAt'] as Timestamp).toDate().toIso8601String();
    }
  }
}
