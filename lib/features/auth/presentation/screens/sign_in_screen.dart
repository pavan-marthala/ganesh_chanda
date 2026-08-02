import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/DI/injection.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:ganesh_chanda/features/auth/presentation/widgets/email_login_form_card.dart';
import 'package:ganesh_chanda/features/auth/presentation/widgets/hero_panel_header.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          return Scaffold(
            backgroundColor: colors.background,
            body: SafeArea(
              top: false,
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Hero Orange Header Panel
                        const HeroPanelHeader(),

                        // Form Container overlaying header slightly
                        Transform.translate(
                          offset: const Offset(0, -26),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const EmailLoginFormCard(),
                                const SizedBox(height: 20),

                                Row(
                                  mainAxisSize: .min,
                                  children: [
                                    Text(
                                      "New to Ganesh Chanda?",
                                      style: typography.bodySmall.copyWith(
                                        fontSize: 12,
                                        color: colors.text4,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.push(AppRoutes.signUp);
                                      },
                                      child: Text(
                                        'Create Your Community',
                                        style: typography.labelLarge.copyWith(
                                          color: colors.primary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: .min,
                                  children: [
                                    Text(
                                      "Got an invite code?",
                                      style: typography.bodySmall.copyWith(
                                        fontSize: 12,
                                        color: colors.text4,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.push(AppRoutes.joinCommunity);
                                      },
                                      child: Text(
                                        'Join Community',
                                        style: typography.labelLarge.copyWith(
                                          color: colors.primary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Terms & Privacy Policy Footer
                                Text.rich(
                                  TextSpan(
                                    text: 'By continuing you agree to our ',
                                    children: [
                                      TextSpan(
                                        text: 'Terms',
                                        style: TextStyle(
                                          color: colors.accent2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const TextSpan(text: ' & '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          color: colors.accent2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  style: typography.bodySmall.copyWith(
                                    fontSize: 12,
                                    color: colors.text4,
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
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
