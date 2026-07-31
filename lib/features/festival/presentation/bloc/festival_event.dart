part of 'festival_bloc.dart';

@freezed
class FestivalEvent with _$FestivalEvent {
  const factory FestivalEvent.loadCurrentCommunityFestivalRequested() =
      _LoadCurrentCommunityFestivalRequested;

  const factory FestivalEvent.loadFestivalsRequested() =
      _LoadFestivalsRequested;

  const factory FestivalEvent.createFestivalRequested({
    required Festival festival,
  }) = _CreateFestivalRequested;
}
