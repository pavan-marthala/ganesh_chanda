part of 'sign_in_bloc.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? emailError,
    String? passwordError,
  }) = _SignInState;
}
