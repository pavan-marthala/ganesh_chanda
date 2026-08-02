part of 'sign_up_volunteer_bloc.dart';

@freezed
class SignUpVolunteerEvent with _$SignUpVolunteerEvent {
  const factory SignUpVolunteerEvent.displayNameChanged(String displayName) =
      DisplayNameChanged;
  const factory SignUpVolunteerEvent.emailChanged(String email) = EmailChanged;
  const factory SignUpVolunteerEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory SignUpVolunteerEvent.confirmPasswordChanged(
    String confirmPassword,
  ) = ConfirmPasswordChanged;
  const factory SignUpVolunteerEvent.signUpSubmitted(String? communityId) =
      SignUpSubmitted;
}
