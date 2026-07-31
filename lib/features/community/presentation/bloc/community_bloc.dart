import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/community.dart';
import '../../domain/repository/community_repository.dart';

part 'community_event.dart';
part 'community_state.dart';
part 'community_bloc.freezed.dart';

@injectable
class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository _communityRepository;

  CommunityBloc(this._communityRepository)
      : super(const CommunityState()) {
    on<CommunityEvent>((event, emit) async {
      await event.map(
        createCommunityRequested: (e) async {
          emit(
            state.copyWith(
              communityStatus: StateStatus.loading,
              communityError: null,
            ),
          );
          try {
            final createdCommunity =
                await _communityRepository.createCommunity(e.community);
            emit(
              state.copyWith(
                community: createdCommunity,
                communityStatus: StateStatus.loaded,
                communityError: null,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                communityStatus: StateStatus.error,
                communityError: errorMessage,
              ),
            );
          }
        },
        loadCurrentCommunityRequested: (e) async {
          emit(
            state.copyWith(
              communityStatus: StateStatus.loading,
              communityError: null,
            ),
          );
          try {
            final community =
                await _communityRepository.getCurrentUserCommunity();
            if (community != null) {
              emit(
                state.copyWith(
                  community: community,
                  communityStatus: StateStatus.loaded,
                  communityError: null,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  communityStatus: StateStatus.empty,
                  communityError: 'No community found for current user.',
                ),
              );
            }
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                communityStatus: StateStatus.error,
                communityError: errorMessage,
              ),
            );
          }
        },
      );
    });
  }
}
