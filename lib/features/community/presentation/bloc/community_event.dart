part of 'community_bloc.dart';

@freezed
class CommunityEvent with _$CommunityEvent {
  const factory CommunityEvent.createCommunityRequested({
    required Community community,
  }) = _CreateCommunityRequested;

  const factory CommunityEvent.loadCurrentCommunityRequested() =
      _LoadCurrentCommunityRequested;
}
