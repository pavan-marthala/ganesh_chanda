part of 'sign_up_volunteer_bloc.dart';

@freezed
abstract class SignUpVolunteerState with _$SignUpVolunteerState {
  const factory SignUpVolunteerState({
    @Default('') String displayName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,

    // Field-specific validation errors
    String? displayNameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,

    // Real-time password requirement flags
    @Default(false) bool hasMinLength,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasNumber,
    @Default(false) bool hasSpecialChar,
    @Default('Weak') String passwordStrength,
  }) = _SignUpVolunteerState;
}
