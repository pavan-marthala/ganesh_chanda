import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/DI/injection.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_up_volunteer/sign_up_volunteer_bloc.dart';
import 'package:ganesh_chanda/features/community/domain/models/community.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/screens/festivals_home_screen.dart';
import 'package:go_router/go_router.dart';

class SignUpVolunteerScreen extends StatefulWidget {
  const SignUpVolunteerScreen({super.key});

  @override
  State<SignUpVolunteerScreen> createState() => _SignUpVolunteerScreenState();
}

class _SignUpVolunteerScreenState extends State<SignUpVolunteerScreen> {
  String? _prevDisplayNameError;
  String? _prevEmailError;
  String? _prevPasswordError;
  String? _prevConfirmPasswordError;
  String? _prevErrorMessage;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocProvider<SignUpVolunteerBloc>(
      create: (context) => getIt<SignUpVolunteerBloc>(),
      child: BlocConsumer<SignUpVolunteerBloc, SignUpVolunteerState>(
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
          return BlocSelector<CommunityBloc, CommunityState, Community>(
            selector: (state) {
              return state.lookedUpCommunity!;
            },
            builder: (context, community) {
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
                    'Create Your Account',
                    style: typography.headlineSmall.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: colors.textPrimary,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: Container(color: colors.border, height: 1),
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
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: colors.card,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: context.appGradients.secondary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        getInitials(community.name),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Joining',
                                          style: typography.titleSmall.copyWith(
                                            color: colors.text4,
                                          ),
                                        ),
                                        Text(
                                          community.name,
                                          style: typography.labelSmall.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: colors.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colors.success.withValues(
                                        alpha: 0.22,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Volunteer",
                                      style: typography.caption.copyWith(
                                        color: colors.success,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Subtitle
                            Text(
                              "Set up your login — you'll use this to access the community anytime.",
                              style: typography.bodySmall.copyWith(
                                color: colors.text4,
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Display Name Field
                            AppTextField(
                              labelText: 'Full Name',
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
                                context.read<SignUpVolunteerBloc>().add(
                                  SignUpVolunteerEvent.displayNameChanged(val),
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
                                context.read<SignUpVolunteerBloc>().add(
                                  SignUpVolunteerEvent.emailChanged(val),
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
                                context.read<SignUpVolunteerBloc>().add(
                                  SignUpVolunteerEvent.passwordChanged(val),
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
                                context.read<SignUpVolunteerBloc>().add(
                                  SignUpVolunteerEvent.confirmPasswordChanged(
                                    val,
                                  ),
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
                                      context.read<SignUpVolunteerBloc>().add(
                                        SignUpVolunteerEvent.signUpSubmitted(
                                          community.id,
                                        ),
                                      );
                                    },
                              isLoading: state.isSubmitting,
                              text: state.isSubmitting
                                  ? 'Creating...'
                                  : 'Continue',
                              color: colors.primary,
                              icon: Icon(
                                Icons.arrow_forward_rounded,
                                color: colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
