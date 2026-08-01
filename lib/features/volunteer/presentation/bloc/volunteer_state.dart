part of 'volunteer_bloc.dart';

@freezed
abstract class VolunteerState with _$VolunteerState {
  const factory VolunteerState({
    @Default([]) List<AppUser> volunteers,
    @Default(StateStatus.initial) StateStatus volunteersStatus,
    String? volunteersError,
    @Default(StateStatus.initial) StateStatus volunteerActionStatus,
    String? volunteerActionError,
  }) = _VolunteerState;
}
