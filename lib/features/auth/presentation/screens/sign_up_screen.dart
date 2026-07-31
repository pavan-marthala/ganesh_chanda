import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/DI/injection.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _prevDisplayNameError;
  String? _prevEmailError;
  String? _prevPasswordError;
  String? _prevConfirmPasswordError;
  String? _prevErrorMessage;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocProvider<SignUpBloc>(
      create: (context) => getIt<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.errorMessage != null &&
              state.errorMessage != _prevErrorMessage) {
            HapticFeedback.mediumImpact();
            showErrorToast(message: state.errorMessage!);
          }
          if ((state.displayNameError != null &&
                  state.displayNameError != _prevDisplayNameError) ||
              (state.emailError != null &&
                  state.emailError != _prevEmailError) ||
              (state.passwordError != null &&
                  state.passwordError != _prevPasswordError) ||
              (state.confirmPasswordError != null &&
                  state.confirmPasswordError != _prevConfirmPasswordError)) {
            HapticFeedback.mediumImpact();
          }
          if (state.isSuccess) {
            HapticFeedback.lightImpact();
            TextInput.finishAutofillContext();
          }

          _prevDisplayNameError = state.displayNameError;
          _prevEmailError = state.emailError;
          _prevPasswordError = state.passwordError;
          _prevConfirmPasswordError = state.confirmPasswordError;
          _prevErrorMessage = state.errorMessage;
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: colors.background,
            appBar: AppBar(
              backgroundColor: colors.surfaceLight,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colors.surfaceLight,
                      shape: BoxShape.circle,
                      border: Border.all(color: colors.border),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: colors.textPrimary,
                        size: 20,
                      ),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(AppRoutes.signIn);
                        }
                      },
                    ),
                  ),
                ),
              ),
              titleSpacing: 12,
              centerTitle: false,
              title: Text(
                'Create Your Community',
                style: typography.headlineSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: colors.textPrimary,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: colors.border,
                  height: 1,
                ),
              ),
            ),
            body: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: context.appGradients.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.primary.withValues(alpha: 0.28),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                color: colors.border,
                              ),
                            ),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.surfaceLight,
                                border: Border.all(color: colors.border, width: 1.5),
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: colors.text4,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Eyebrow label
                        Text(
                          'STEP 1 OF 2',
                          style: typography.labelSmall.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                            letterSpacing: 1.32,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Title
                        Text(
                          'Create your admin account',
                          style: typography.titleLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textPrimary,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Subtitle
                        Text(
                          'This will be your login for managing your committee and its festivals.',
                          style: typography.bodyMedium.copyWith(
                            color: colors.text4,
                            fontSize: 13.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Display Name Field
                        AppTextField(
                          labelText: 'Display Name',
                          hintText: 'e.g. Rohit Kulkarni',
                          errorText: state.displayNameError,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.name],
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                          onChanged: (val) {
                            context.read<SignUpBloc>().add(
                                  SignUpEvent.displayNameChanged(val),
                                );
                          },
                        ),
                        const SizedBox(height: 20),

                        // Email Address Field
                        AppTextField(
                          labelText: 'Email Address',
                          hintText: 'you@example.com',
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
                            context.read<SignUpBloc>().add(
                                  SignUpEvent.emailChanged(val),
                                );
                          },
                        ),
                        const SizedBox(height: 20),

                        // Password Field
                        AppTextField(
                          labelText: 'Password',
                          hintText: 'Create a password',
                          errorText: state.passwordError,
                          isPassword: true,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.newPassword],
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: colors.text4,
                            size: 20,
                          ),
                          onChanged: (val) {
                            context.read<SignUpBloc>().add(
                                  SignUpEvent.passwordChanged(val),
                                );
                          },
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'At least 8 characters, with a number',
                          style: typography.caption.copyWith(
                            fontSize: 12,
                            color: colors.text4,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Confirm Password Field
                        AppTextField(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          errorText: state.confirmPasswordError,
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.newPassword],
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                          onChanged: (val) {
                            context.read<SignUpBloc>().add(
                                  SignUpEvent.confirmPasswordChanged(val),
                                );
                          },
                        ),
                        const SizedBox(height: 34),

                        // Submit / Continue Button
                        AppButton(
                          width: double.infinity,
                          onPressed: state.isSubmitting
                              ? null
                              : () {
                                  context.read<SignUpBloc>().add(
                                        const SignUpEvent.signUpSubmitted(),
                                      );
                                },
                          isLoading: state.isSubmitting,
                          text: state.isSubmitting ? 'Creating...' : 'Continue',
                          color: colors.primary,
                          icon: Icon(Icons.arrow_forward_rounded, color: colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        const SizedBox(height: 30),

                        // Footer link
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Already creating a community? ',
                                style: typography.caption.copyWith(
                                  fontSize: 12,
                                  color: colors.text4,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (context.canPop()) {
                                    context.pop();
                                  } else {
                                    context.go(AppRoutes.signIn);
                                  }
                                },
                                child: Text(
                                  'Back to login',
                                  style: typography.caption.copyWith(
                                    fontSize: 11.5,
                                    color: colors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
