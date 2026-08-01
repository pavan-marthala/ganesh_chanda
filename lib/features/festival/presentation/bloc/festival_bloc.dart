import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/festival.dart';
import '../../domain/repository/festival_repository.dart';

part 'festival_event.dart';
part 'festival_state.dart';
part 'festival_bloc.freezed.dart';

@injectable
class FestivalBloc extends Bloc<FestivalEvent, FestivalState> {
  final FestivalRepository _festivalRepository;

  FestivalBloc(this._festivalRepository) : super(const FestivalState()) {
    on<FestivalEvent>((event, emit) async {
      await event.map(
        getFestivalByIdRequested: (e) async {
          emit(
            state.copyWith(
              festivalStatus: StateStatus.loading,
              festivalError: null,
            ),
          );
          try {
            final festival = await _festivalRepository.getFestivalById(
              e.festivalId,
            );
            if (festival != null) {
              emit(
                state.copyWith(
                  festival: festival,
                  festivalStatus: StateStatus.loaded,
                  festivalError: null,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  festivalStatus: StateStatus.empty,
                  festivalError: 'Festival not found.',
                ),
              );
            }
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalStatus: StateStatus.error,
                festivalError: errorMessage,
              ),
            );
          }
        },
        loadFestivalsRequested: (e) async {
          emit(
            state.copyWith(
              festivalsStatus: StateStatus.loading,
              festivalsError: null,
            ),
          );
          try {
            final festivals = await _festivalRepository.getCommunityFestivals(
              e.communityId,
            );
            emit(
              state.copyWith(
                festivals: festivals,
                festivalsStatus: festivals.isEmpty
                    ? StateStatus.empty
                    : StateStatus.loaded,
                festivalsError: null,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalsStatus: StateStatus.error,
                festivalsError: errorMessage,
              ),
            );
          }
        },
        createFestivalRequested: (e) async {
          emit(
            state.copyWith(
              festivalActionStatus: StateStatus.loading,
              festivalActionError: null,
            ),
          );
          try {
            final createdFestival = await _festivalRepository.createFestival(
              e.festival,
            );
            final updatedFestivals = [createdFestival, ...state.festivals];
            emit(
              state.copyWith(
                festival: createdFestival,
                festivals: updatedFestivals,
                festivalStatus: StateStatus.loaded,
                festivalsStatus: StateStatus.loaded,
                festivalActionStatus: StateStatus.loaded,
                festivalActionError: null,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.error,
                festivalActionError: errorMessage,
              ),
            );
          }
        },
        updateFestivalRequested: (e) async {
          emit(
            state.copyWith(
              festivalActionStatus: StateStatus.loading,
              festivalActionError: null,
            ),
          );
          try {
            final updatedFestival = await _festivalRepository.updateFestival(
              e.festival,
            );
            emit(
              state.copyWith(
                festival: updatedFestival,
                festivalActionStatus: StateStatus.loaded,
                festivalActionError: null,
              ),
            );
            add(FestivalEvent.loadFestivalsRequested(e.communityId));
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.error,
                festivalActionError: errorMessage,
              ),
            );
          }
        },
        deleteFestivalRequested: (e) async {
          emit(
            state.copyWith(
              festivalActionStatus: StateStatus.loading,
              festivalActionError: null,
            ),
          );
          try {
            await _festivalRepository.deleteFestival(e.festivalId);
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.loaded,
                festivalActionError: null,
              ),
            );
            add(FestivalEvent.loadFestivalsRequested(e.communityId));
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.error,
                festivalActionError: errorMessage,
              ),
            );
          }
        },
        assignVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              festivalActionStatus: StateStatus.loading,
              festivalActionError: null,
            ),
          );
          try {
            await _festivalRepository.assignVolunteer(
              festivalId: e.festivalId,
              volunteerId: e.volunteerId,
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.loaded,
                festivalActionError: null,
              ),
            );
            add(FestivalEvent.loadFestivalsRequested(e.communityId));
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.error,
                festivalActionError: errorMessage,
              ),
            );
          }
        },
        removeVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              festivalActionStatus: StateStatus.loading,
              festivalActionError: null,
            ),
          );
          try {
            await _festivalRepository.removeVolunteer(
              festivalId: e.festivalId,
              volunteerId: e.volunteerId,
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.loaded,
                festivalActionError: null,
              ),
            );
            add(FestivalEvent.loadFestivalsRequested(e.communityId));
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
              'Exception: ',
              '',
            );
            emit(
              state.copyWith(
                festivalActionStatus: StateStatus.error,
                festivalActionError: errorMessage,
              ),
            );
          }
        },
      );
    });
  }
}
