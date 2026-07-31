import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/DI/injection.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';

import '../../../../core/utils/app_buitton.dart';

class EmailLoginFormCard extends StatefulWidget {
  const EmailLoginFormCard({super.key});

  @override
  State<EmailLoginFormCard> createState() => _EmailLoginFormCardState();
}

class _EmailLoginFormCardState extends State<EmailLoginFormCard> {
  bool _obscurePassword = true;
  String? _prevEmailError;
  String? _prevPasswordError;
  String? _prevErrorMessage;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocProvider<SignInBloc>(
      create: (context) => getIt<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.errorMessage != null &&
              state.errorMessage != _prevErrorMessage) {
            HapticFeedback.mediumImpact();
            print(state.errorMessage);
            showErrorToast(message: state.errorMessage!);
          }
          if ((state.emailError != null &&
                  state.emailError != _prevEmailError) ||
              (state.passwordError != null &&
                  state.passwordError != _prevPasswordError)) {
            HapticFeedback.mediumImpact();
          }
          if (state.isSuccess) {
            HapticFeedback.lightImpact();
            TextInput.finishAutofillContext();
          }

          _prevEmailError = state.emailError;
          _prevPasswordError = state.passwordError;
          _prevErrorMessage = state.errorMessage;
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: colors.border),
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(
                    alpha: context.isDark ? 0.35 : 0.08,
                  ),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  errorText: state.emailError,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  prefixIcon: Icon(
                    Icons.mail_outline_rounded,
                    color: colors.text4,
                    size: 20,
                  ),
                  onChanged: (val) {
                    context.read<SignInBloc>().add(
                      SignInEvent.emailChanged(val),
                    );
                  },
                ),
                const SizedBox(height: 18),

                AppTextField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  errorText: state.passwordError,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                  prefixIcon: Icon(
                    Icons.lock_open_outlined,
                    color: colors.text4,
                    size: 20,
                  ),
                  onChanged: (val) {
                    context.read<SignInBloc>().add(
                      SignInEvent.passwordChanged(val),
                    );
                  },
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: typography.labelSmall.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                AppButton(
                  onPressed: state.isSubmitting
                      ? null
                      : () {
                          context.read<SignInBloc>().add(
                            const SignInEvent.signInSubmitted(),
                          );
                        },
                  isLoading: state.isSubmitting,
                  text: state.isSubmitting ? 'Signing In...' : 'Sign In',
                  color: colors.primary,
                  icon: Icon(Icons.arrow_forward_rounded, color: colors.white),
                  padding: .symmetric(vertical: 10),
                ),
                const SizedBox(height: 12),

                Text(
                  "We'll take you straight to your dashboard — your role is set by the committee, no need to pick one.",
                  textAlign: TextAlign.center,
                  style: typography.caption.copyWith(
                    fontSize: 11.5,
                    color: colors.text4,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
