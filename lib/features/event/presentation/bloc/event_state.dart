part of 'event_bloc.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState({
    @Default([]) List<Event> events,
    @Default(StateStatus.initial) StateStatus eventsStatus,
    String? eventsError,

    Event? selectedEvent,
    @Default(StateStatus.initial) StateStatus eventDetailsStatus,
    String? eventDetailsError,

    @Default(StateStatus.initial) StateStatus eventActionStatus,
    String? eventActionError,
  }) = _EventState;
}
