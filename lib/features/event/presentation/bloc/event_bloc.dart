import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/event.dart';
import '../../domain/repository/event_repository.dart';

part 'event_event.dart';
part 'event_state.dart';
part 'event_bloc.freezed.dart';

@injectable
class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository _eventRepository;

  EventBloc(this._eventRepository) : super(const EventState()) {
    on<EventEvent>((event, emit) async {
      await event.map(
        loadEventsByFestivalRequested: (e) async {
          emit(
            state.copyWith(
              eventsStatus: StateStatus.loading,
              eventsError: null,
            ),
          );
          try {
            final events = await _eventRepository.getEventsByFestival(
              e.festivalId,
            );
            emit(
              state.copyWith(
                events: events,
                eventsStatus:
                    events.isEmpty ? StateStatus.empty : StateStatus.loaded,
                eventsError: null,
              ),
            );
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                eventsStatus: StateStatus.error,
                eventsError: errorMessage,
              ),
            );
          }
        },
        loadEventsByCommunityRequested: (e) async {
          emit(
            state.copyWith(
              eventsStatus: StateStatus.loading,
              eventsError: null,
            ),
          );
          try {
            final events = await _eventRepository.getEventsByCommunity(
              e.communityId,
            );
            emit(
              state.copyWith(
                events: events,
                eventsStatus:
                    events.isEmpty ? StateStatus.empty : StateStatus.loaded,
                eventsError: null,
              ),
            );
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                eventsStatus: StateStatus.error,
                eventsError: errorMessage,
              ),
            );
          }
        },
        getEventByIdRequested: (e) async {
          emit(
            state.copyWith(
              eventDetailsStatus: StateStatus.loading,
              eventDetailsError: null,
            ),
          );
          try {
            final event = await _eventRepository.getEventById(
              e.eventId,
            );
            if (event != null) {
              emit(
                state.copyWith(
                  selectedEvent: event,
                  eventDetailsStatus: StateStatus.loaded,
                  eventDetailsError: null,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  selectedEvent: null,
                  eventDetailsStatus: StateStatus.empty,
                  eventDetailsError: 'Event not found.',
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                eventDetailsStatus: StateStatus.error,
                eventDetailsError: errorMessage,
              ),
            );
          }
        },
        createEventRequested: (e) async {
          emit(
            state.copyWith(
              eventActionStatus: StateStatus.loading,
              eventActionError: null,
            ),
          );
          try {
            final createdEvent = await _eventRepository.createEvent(
              e.event,
            );
            final updatedList = [createdEvent, ...state.events];
            emit(
              state.copyWith(
                events: updatedList,
                selectedEvent: createdEvent,
                eventsStatus: StateStatus.loaded,
                eventActionStatus: StateStatus.loaded,
                eventActionError: null,
              ),
            );
            if (e.event.festivalId.isNotEmpty) {
              add(
                EventEvent.loadEventsByFestivalRequested(
                  festivalId: e.event.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                eventActionStatus: StateStatus.error,
                eventActionError: errorMessage,
              ),
            );
          }
        },
        updateEventRequested: (e) async {
          emit(
            state.copyWith(
              eventActionStatus: StateStatus.loading,
              eventActionError: null,
            ),
          );
          try {
            final updatedEvent = await _eventRepository.updateEvent(
              e.event,
            );
            final updatedList = state.events.map((ev) {
              return ev.id == updatedEvent.id ? updatedEvent : ev;
            }).toList();
            emit(
              state.copyWith(
                events: updatedList,
                selectedEvent: updatedEvent,
                eventActionStatus: StateStatus.loaded,
                eventActionError: null,
              ),
            );
            if (e.event.festivalId.isNotEmpty) {
              add(
                EventEvent.loadEventsByFestivalRequested(
                  festivalId: e.event.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                eventActionStatus: StateStatus.error,
                eventActionError: errorMessage,
              ),
            );
          }
        },
        deleteEventRequested: (e) async {
          emit(
            state.copyWith(
              eventActionStatus: StateStatus.loading,
              eventActionError: null,
            ),
          );
          try {
            await _eventRepository.deleteEvent(e.eventId);
            final updatedList =
                state.events.where((ev) => ev.id != e.eventId).toList();
            emit(
              state.copyWith(
                events: updatedList,
                eventActionStatus: StateStatus.loaded,
                eventActionError: null,
              ),
            );
            if (e.festivalId.isNotEmpty) {
              add(
                EventEvent.loadEventsByFestivalRequested(
                  festivalId: e.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                eventActionStatus: StateStatus.error,
                eventActionError: errorMessage,
              ),
            );
          }
        },
      );
    });
  }
}
