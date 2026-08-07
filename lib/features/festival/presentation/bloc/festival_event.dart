part of 'festival_bloc.dart';

@freezed
class FestivalEvent with _$FestivalEvent {
  const factory FestivalEvent.getFestivalByIdRequested(
    String festivalId,
  ) = _GetFestivalByIdRequested;

  const factory FestivalEvent.loadFestivalsRequested(
    String communityId,
  ) = _LoadFestivalsRequested;

  const factory FestivalEvent.createFestivalRequested({
    required Festival festival,
  }) = _CreateFestivalRequested;

  const factory FestivalEvent.updateFestivalRequested({
    required Festival festival,
    required String communityId,
  }) = _UpdateFestivalRequested;

  const factory FestivalEvent.deleteFestivalRequested({
    required String festivalId,
    required String communityId,
  }) = _DeleteFestivalRequested;

  const factory FestivalEvent.assignVolunteerRequested({
    required String festivalId,
    required String volunteerId,
    required String communityId,
  }) = _AssignVolunteerRequested;

  const factory FestivalEvent.removeVolunteerRequested({
    required String festivalId,
    required String volunteerId,
    required String communityId,
  }) = _RemoveVolunteerRequested;
  const factory FestivalEvent.updateSummary() = _UpdateSummary;
}
