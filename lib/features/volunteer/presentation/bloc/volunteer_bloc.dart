import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/volunteer_repository.dart';

part 'volunteer_event.dart';
part 'volunteer_state.dart';
part 'volunteer_bloc.freezed.dart';

@injectable
class VolunteerBloc extends Bloc<VolunteerEvent, VolunteerState> {
  final VolunteerRepository _volunteerRepository;

  VolunteerBloc(this._volunteerRepository) : super(const VolunteerState()) {
    on<VolunteerEvent>((event, emit) async {
      await event.map(
        loadVolunteersRequested: (e) async {
          emit(
            state.copyWith(
              volunteersStatus: StateStatus.loading,
              volunteersError: null,
            ),
          );
          try {
            final volunteers = await _volunteerRepository.getVolunteers(
              e.communityId,
            );
            emit(
              state.copyWith(
                volunteers: volunteers,
                volunteersStatus: volunteers.isEmpty
                    ? StateStatus.empty
                    : StateStatus.loaded,
                volunteersError: null,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
                  'Exception: ',
                  '',
                );
            emit(
              state.copyWith(
                volunteersStatus: StateStatus.error,
                volunteersError: errorMessage,
              ),
            );
          }
        },
        addVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              volunteerActionStatus: StateStatus.loading,
              volunteerActionError: null,
            ),
          );
          try {
            await _volunteerRepository.addVolunteer(
              e.volunteer,
              e.communityId,
            );
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.loaded,
                volunteerActionError: null,
              ),
            );
            add(
              VolunteerEvent.loadVolunteersRequested(
                communityId: e.communityId,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
                  'Exception: ',
                  '',
                );
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.error,
                volunteerActionError: errorMessage,
              ),
            );
          }
        },
        updateVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              volunteerActionStatus: StateStatus.loading,
              volunteerActionError: null,
            ),
          );
          try {
            await _volunteerRepository.updateVolunteer(e.volunteer);
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.loaded,
                volunteerActionError: null,
              ),
            );
            add(
              VolunteerEvent.loadVolunteersRequested(
                communityId: e.communityId,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
                  'Exception: ',
                  '',
                );
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.error,
                volunteerActionError: errorMessage,
              ),
            );
          }
        },
        activateVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              volunteerActionStatus: StateStatus.loading,
              volunteerActionError: null,
            ),
          );
          try {
            await _volunteerRepository.activateVolunteer(e.userId);
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.loaded,
                volunteerActionError: null,
              ),
            );
            add(
              VolunteerEvent.loadVolunteersRequested(
                communityId: e.communityId,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
                  'Exception: ',
                  '',
                );
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.error,
                volunteerActionError: errorMessage,
              ),
            );
          }
        },
        deactivateVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              volunteerActionStatus: StateStatus.loading,
              volunteerActionError: null,
            ),
          );
          try {
            await _volunteerRepository.deactivateVolunteer(e.userId);
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.loaded,
                volunteerActionError: null,
              ),
            );
            add(
              VolunteerEvent.loadVolunteersRequested(
                communityId: e.communityId,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
                  'Exception: ',
                  '',
                );
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.error,
                volunteerActionError: errorMessage,
              ),
            );
          }
        },
        deleteVolunteerRequested: (e) async {
          emit(
            state.copyWith(
              volunteerActionStatus: StateStatus.loading,
              volunteerActionError: null,
            ),
          );
          try {
            await _volunteerRepository.deleteVolunteer(e.userId);
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.loaded,
                volunteerActionError: null,
              ),
            );
            add(
              VolunteerEvent.loadVolunteersRequested(
                communityId: e.communityId,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst(
                  'Exception: ',
                  '',
                );
            emit(
              state.copyWith(
                volunteerActionStatus: StateStatus.error,
                volunteerActionError: errorMessage,
              ),
            );
          }
        },
      );
    });
  }
}
