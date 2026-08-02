import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_volunteer_event.dart';
part 'sign_up_volunteer_state.dart';
part 'sign_up_volunteer_bloc.freezed.dart';

@injectable
class SignUpVolunteerBloc
    extends Bloc<SignUpVolunteerEvent, SignUpVolunteerState> {
  final AuthRepository _authRepository;
  SignUpVolunteerBloc(this._authRepository)
    : super(const SignUpVolunteerState()) {
    on<DisplayNameChanged>((event, emit) {
      final value = event.displayName.trim();
      String? error;
      if (value.isNotEmpty) {
        if (value.length < 2) {
          error = 'Display name must be at least 2 characters';
        } else if (value.length > 50) {
          error = 'Display name must be 50 characters or less';
        }
      }
      emit(
        state.copyWith(displayName: event.displayName, displayNameError: error),
      );
    });

    on<EmailChanged>((event, emit) {
      final value = event.email.trim();
      String? error;
      if (value.isNotEmpty) {
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          error = 'Enter a valid email address';
        }
      }
      emit(state.copyWith(email: event.email, emailError: error));
    });

    on<PasswordChanged>((event, emit) {
      final value = event.password;
      final hasMinLength = value.length >= 6 && value.length <= 4096;
      final hasUppercase = value.contains(RegExp(r'[A-Z]'));
      final hasLowercase = value.contains(RegExp(r'[a-z]'));
      final hasNumber = value.contains(RegExp(r'[0-9]'));
      final hasSpecialChar = value.contains(RegExp(r'[^a-zA-Z0-9]'));

      String? error;
      if (value.isNotEmpty) {
        if (!hasMinLength) {
          error = 'Password must be at least 6 characters';
        } else if (!hasUppercase ||
            !hasLowercase ||
            !hasNumber ||
            !hasSpecialChar) {
          error = 'Password does not meet all requirements';
        }
      }

      final strength = _calculatePasswordStrength(
        value,
        hasUppercase,
        hasLowercase,
        hasNumber,
        hasSpecialChar,
      );

      emit(
        state.copyWith(
          password: event.password,
          passwordError: error,
          hasMinLength: hasMinLength,
          hasUppercase: hasUppercase,
          hasLowercase: hasLowercase,
          hasNumber: hasNumber,
          hasSpecialChar: hasSpecialChar,
          passwordStrength: strength,
        ),
      );
    });

    on<ConfirmPasswordChanged>((event, emit) {
      final value = event.confirmPassword;
      String? error;
      if (value.isNotEmpty && value != state.password) {
        error = 'Passwords do not match';
      }
      emit(
        state.copyWith(
          confirmPassword: event.confirmPassword,
          confirmPasswordError: error,
        ),
      );
    });

    on<SignUpSubmitted>((event, emit) async {
      // 1. Display Name Validation
      final displayNameTrimmed = state.displayName.trim();
      if (displayNameTrimmed.isEmpty) {
        emit(state.copyWith(displayNameError: 'Display name is required'));
        return;
      }
      if (displayNameTrimmed.length < 2 || displayNameTrimmed.length > 50) {
        emit(
          state.copyWith(
            displayNameError:
                'Display name must be between 2 and 50 characters',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          displayNameError: null,
          isSubmitting: true,
          errorMessage: null,
        ),
      );
      // 2. Email Format Validation
      final email = state.email.trim();
      if (email.isEmpty) {
        emit(
          state.copyWith(emailError: 'Email is required', isSubmitting: false),
        );
        return;
      }
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(email)) {
        emit(
          state.copyWith(
            emailError: 'Enter a valid email address',
            isSubmitting: false,
          ),
        );
        return;
      }
      emit(state.copyWith(emailError: null));

      // 3. Password Policy Validation
      final password = state.password;
      final hasMinLength = password.length >= 6 && password.length <= 4096;
      final hasUppercase = password.contains(RegExp(r'[A-Z]'));
      final hasLowercase = password.contains(RegExp(r'[a-z]'));
      final hasNumber = password.contains(RegExp(r'[0-9]'));
      final hasSpecialChar = password.contains(RegExp(r'[^a-zA-Z0-9]'));

      if (!hasMinLength ||
          !hasUppercase ||
          !hasLowercase ||
          !hasNumber ||
          !hasSpecialChar) {
        emit(
          state.copyWith(
            passwordError: 'Password does not meet all requirements',
            isSubmitting: false,
          ),
        );
        return;
      }
      emit(state.copyWith(passwordError: null));

      // 4. Confirm Password Validation
      if (state.confirmPassword.isEmpty) {
        emit(
          state.copyWith(
            confirmPasswordError: 'Confirm password is required',
            isSubmitting: false,
          ),
        );
        return;
      }
      if (state.confirmPassword != password) {
        emit(
          state.copyWith(
            confirmPasswordError: 'Passwords do not match',
            isSubmitting: false,
          ),
        );
        return;
      }
      emit(state.copyWith(confirmPasswordError: null));

      // Sign up action
      try {
        await _authRepository.signUp(
          email: email,
          password: password,
          displayName: displayNameTrimmed,
          isVolunteer: true,
          communityId: event.communityId,
        );
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } on FirebaseAuthException catch (e) {
        String errorMsg = e.message ?? 'An error occurred';
        if (e.code == 'email-already-in-use') {
          emit(
            state.copyWith(
              emailError: 'This email address is already registered.',
              isSubmitting: false,
            ),
          );
        } else {
          emit(state.copyWith(errorMessage: errorMsg, isSubmitting: false));
        }
      } catch (e) {
        String errorMsg = e.toString().replaceFirst('Exception: ', '');
        if (errorMsg.contains('email-already-in-use') ||
            errorMsg.contains('The email address is already in use')) {
          emit(
            state.copyWith(
              emailError: 'This email address is already registered.',
              isSubmitting: false,
            ),
          );
        } else {
          emit(state.copyWith(errorMessage: errorMsg, isSubmitting: false));
        }
      }
    });
  }

  String _calculatePasswordStrength(
    String password,
    bool hasUppercase,
    bool hasLowercase,
    bool hasNumber,
    bool hasSpecialChar,
  ) {
    if (password.length < 6) return 'Weak';

    int score = 0;
    if (hasUppercase) score++;
    if (hasLowercase) score++;
    if (hasNumber) score++;
    if (hasSpecialChar) score++;

    if (score <= 2) {
      return 'Weak';
    } else if (score == 3) {
      return 'Medium';
    } else if (score == 4) {
      if (password.length >= 8) {
        return 'Very Strong';
      }
      return 'Strong';
    }
    return 'Weak';
  }
}
