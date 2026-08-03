import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/event.dart';

abstract class EventRemoteDataSource {
  Future<Event> createEvent(Event event);
  Future<Event> updateEvent(Event event);
  Future<void> deleteEvent(String eventId);
  Future<Event?> getEventById(String eventId);
  Future<List<Event>> getEventsByFestival(String festivalId);
  Future<List<Event>> getEventsByCommunity(String communityId);
}

@LazySingleton(as: EventRemoteDataSource)
class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  EventRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  @override
  Future<Event> createEvent(Event event) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final docRef = _firestore.collection('events').doc();
      final now = DateTime.now();

      final fullEvent = event.copyWith(
        id: docRef.id,
        createdBy: event.createdBy.isEmpty
            ? (currentUser?.uid ?? '')
            : event.createdBy,
        createdAt: now,
        updatedAt: now,
      );

      final jsonMap = fullEvent.toJson();
      jsonMap['date'] = Timestamp.fromDate(fullEvent.date);
      jsonMap['createdAt'] = Timestamp.fromDate(now);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.set(jsonMap);
      return fullEvent;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Event> updateEvent(Event event) async {
    try {
      final docRef = _firestore.collection('events').doc(event.id);
      final existingDoc = await docRef.get();

      if (!existingDoc.exists || existingDoc.data() == null) {
        throw Exception('Event not found');
      }

      final now = DateTime.now();
      final updatedEvent = event.copyWith(
        updatedAt: now,
      );

      final jsonMap = updatedEvent.toJson();
      jsonMap['date'] = Timestamp.fromDate(updatedEvent.date);
      jsonMap['createdAt'] = Timestamp.fromDate(event.createdAt);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.update(jsonMap);
      return updatedEvent;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteEvent(String eventId) async {
    try {
      await _firestore.collection('events').doc(eventId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Event?> getEventById(String eventId) async {
    try {
      final doc = await _firestore.collection('events').doc(eventId).get();
      if (!doc.exists || doc.data() == null) return null;

      final data = doc.data()!;
      _convertTimestamps(data);
      return Event.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Event>> getEventsByFestival(String festivalId) async {
    try {
      final querySnapshot = await _firestore
          .collection('events')
          .where('festivalId', isEqualTo: festivalId)
          .orderBy('date', descending: false)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Event.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Event>> getEventsByCommunity(String communityId) async {
    try {
      final querySnapshot = await _firestore
          .collection('events')
          .where('communityId', isEqualTo: communityId)
          .orderBy('date', descending: false)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Event.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  void _convertTimestamps(Map<String, dynamic> data) {
    if (data['date'] is Timestamp) {
      data['date'] = (data['date'] as Timestamp).toDate().toIso8601String();
    }
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
