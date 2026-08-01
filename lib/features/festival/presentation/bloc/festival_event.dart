part of 'festival_bloc.dart';

@freezed
class FestivalEvent with _$FestivalEvent {
  const factory FestivalEvent.loadCurrentCommunityFestivalRequested(String communityId) =
      _LoadCurrentCommunityFestivalRequested;

  const factory FestivalEvent.loadFestivalsRequested(String communityId) =
      _LoadFestivalsRequested;

  const factory FestivalEvent.createFestivalRequested({
    required Festival festival,
  }) = _CreateFestivalRequested;
}
