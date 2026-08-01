part of 'volunteer_bloc.dart';

@freezed
abstract class VolunteerEvent with _$VolunteerEvent {
  const factory VolunteerEvent.loadVolunteersRequested({
    required String communityId,
  }) = _LoadVolunteersRequested;

  const factory VolunteerEvent.addVolunteerRequested({
    required AppUser volunteer,
    required String communityId,
  }) = _AddVolunteerRequested;

  const factory VolunteerEvent.updateVolunteerRequested({
    required AppUser volunteer,
    required String communityId,
  }) = _UpdateVolunteerRequested;

  const factory VolunteerEvent.activateVolunteerRequested({
    required String userId,
    required String communityId,
  }) = _ActivateVolunteerRequested;

  const factory VolunteerEvent.deactivateVolunteerRequested({
    required String userId,
    required String communityId,
  }) = _DeactivateVolunteerRequested;

  const factory VolunteerEvent.deleteVolunteerRequested({
    required String userId,
    required String communityId,
  }) = _DeleteVolunteerRequested;
}
