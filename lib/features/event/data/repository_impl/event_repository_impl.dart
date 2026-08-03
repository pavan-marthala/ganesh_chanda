import 'package:injectable/injectable.dart';

import '../../domain/models/event.dart';
import '../../domain/repository/event_repository.dart';
import '../datasource/event_remote_data_source.dart';

@LazySingleton(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource _remoteDataSource;

  EventRepositoryImpl(this._remoteDataSource);

  @override
  Future<Event> createEvent(Event event) async {
    try {
      return await _remoteDataSource.createEvent(event);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Event> updateEvent(Event event) async {
    try {
      return await _remoteDataSource.updateEvent(event);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteEvent(String eventId) async {
    try {
      await _remoteDataSource.deleteEvent(eventId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Event?> getEventById(String eventId) async {
    try {
      return await _remoteDataSource.getEventById(eventId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Event>> getEventsByFestival(String festivalId) async {
    try {
      return await _remoteDataSource.getEventsByFestival(festivalId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Event>> getEventsByCommunity(String communityId) async {
    try {
      return await _remoteDataSource.getEventsByCommunity(communityId);
    } catch (e) {
      rethrow;
    }
  }
}
