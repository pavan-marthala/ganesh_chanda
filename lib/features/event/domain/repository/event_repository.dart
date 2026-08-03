import '../models/event.dart';

abstract class EventRepository {
  Future<Event> createEvent(Event event);
  Future<Event> updateEvent(Event event);
  Future<void> deleteEvent(String eventId);
  Future<Event?> getEventById(String eventId);
  Future<List<Event>> getEventsByFestival(String festivalId);
  Future<List<Event>> getEventsByCommunity(String communityId);
}
