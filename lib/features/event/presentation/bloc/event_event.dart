part of 'event_bloc.dart';

@freezed
class EventEvent with _$EventEvent {
  const factory EventEvent.loadEventsByFestivalRequested({
    required String festivalId,
  }) = _LoadEventsByFestivalRequested;

  const factory EventEvent.loadEventsByCommunityRequested({
    required String communityId,
  }) = _LoadEventsByCommunityRequested;

  const factory EventEvent.getEventByIdRequested({
    required String eventId,
  }) = _GetEventByIdRequested;

  const factory EventEvent.createEventRequested({
    required Event event,
  }) = _CreateEventRequested;

  const factory EventEvent.updateEventRequested({
    required Event event,
  }) = _UpdateEventRequested;

  const factory EventEvent.deleteEventRequested({
    required String eventId,
    required String festivalId,
  }) = _DeleteEventRequested;
}
