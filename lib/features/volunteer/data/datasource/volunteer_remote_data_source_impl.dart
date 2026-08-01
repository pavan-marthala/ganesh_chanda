import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'volunteer_remote_data_source.dart';

@LazySingleton(as: VolunteerRemoteDataSource)
class VolunteerRemoteDataSourceImpl implements VolunteerRemoteDataSource {
  final FirebaseFirestore _firestore;

  VolunteerRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<AppUser>> getVolunteers(String communityId) async {
    final querySnapshot = await _firestore
        .collection('users')
        .where('communityId', isEqualTo: communityId)
        .where('role', isEqualTo: 'volunteer')
        .get();
    return querySnapshot.docs
        .map((doc) => AppUser.fromJson({'userId': doc.id, ...doc.data()}))
        .toList();
  }

  @override
  Future<List<AppUser>> getVolunteersByIds(List<String> volunteerIds) async {
    if (volunteerIds.isEmpty) return [];

    // Firestore FieldPath.documentId whereIn supports chunks of max 30 items
    final List<AppUser> results = [];
    const chunkSize = 30;

    for (var i = 0; i < volunteerIds.length; i += chunkSize) {
      final chunk = volunteerIds.sublist(
        i,
        i + chunkSize > volunteerIds.length ? volunteerIds.length : i + chunkSize,
      );

      final querySnapshot = await _firestore
          .collection('users')
          .where(FieldPath.documentId, whereIn: chunk)
          .get();

      final users = querySnapshot.docs
          .map((doc) => AppUser.fromJson({'userId': doc.id, ...doc.data()}))
          .toList();

      results.addAll(users);
    }

    // Preserve the order of volunteerIds
    final userMap = {for (var user in results) user.id: user};
    final orderedResults = <AppUser>[];
    for (final id in volunteerIds) {
      if (userMap.containsKey(id)) {
        orderedResults.add(userMap[id]!);
      }
    }

    return orderedResults;
  }

  @override
  Future<AppUser> addVolunteer(AppUser volunteer, String communityId) async {
    final docRef = volunteer.id.isNotEmpty
        ? _firestore.collection('users').doc(volunteer.id)
        : _firestore.collection('users').doc();

    final volunteerData = volunteer.copyWith(
      id: docRef.id,
      communityId: communityId,
      role: 'volunteer',
    );

    final jsonMap = volunteerData.toJson();
    jsonMap.remove('userId');

    await docRef.set(jsonMap, SetOptions(merge: true));

    return volunteerData;
  }

  @override
  Future<AppUser> updateVolunteer(AppUser volunteer) async {
    final docRef = _firestore.collection('users').doc(volunteer.id);

    final updateData = <String, dynamic>{
      'displayName': volunteer.displayName,
      if (volunteer.phoneNumber != null) 'phoneNumber': volunteer.phoneNumber,
      if (volunteer.photoUrl != null) 'photoUrl': volunteer.photoUrl,
    };

    await docRef.update(updateData);

    final updatedDoc = await docRef.get();
    if (!updatedDoc.exists || updatedDoc.data() == null) {
      throw Exception('Volunteer not found after update');
    }

    return AppUser.fromJson({'userId': updatedDoc.id, ...updatedDoc.data()!});
  }

  @override
  Future<void> activateVolunteer(String userId) async {
    await _firestore.collection('users').doc(userId).update({
      'isActive': true,
    });
  }

  @override
  Future<void> deactivateVolunteer(String userId) async {
    await _firestore.collection('users').doc(userId).update({
      'isActive': false,
    });
  }

  @override
  Future<void> deleteVolunteer(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }
}
