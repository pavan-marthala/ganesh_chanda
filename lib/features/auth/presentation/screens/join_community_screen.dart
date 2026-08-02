import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinCommunityScreen extends StatefulWidget {
  const JoinCommunityScreen({super.key});

  @override
  State<JoinCommunityScreen> createState() => _JoinCommunityScreenState();
}

class _JoinCommunityScreenState extends State<JoinCommunityScreen> {
  final controller = PinInputController();
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  StateStatus _prevLookupStatus = StateStatus.initial;
  String? _prevLookupError;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onContinuePressed(BuildContext context) {
    final code = controller.text;
    context.read<CommunityBloc>().add(
      CommunityEvent.loadCommunityByCodeRequested(communityCode: code),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocConsumer<CommunityBloc, CommunityState>(
      listenWhen: (previous, current) {
        return previous.communityLookupStatus != current.communityLookupStatus;
      },
      listener: (context, state) {
        if (state.communityLookupStatus == StateStatus.error &&
            state.communityLookupError != null &&
            state.communityLookupError != _prevLookupError) {
          controller.triggerError();
          controller.clear();
          showErrorToast(message: state.communityLookupError!);
        }

        if (state.communityLookupStatus == StateStatus.empty &&
            _prevLookupStatus != StateStatus.empty) {
          controller.triggerError();
          controller.clear();
          showErrorToast(message: 'Invalid community code. Please try again.');
        }

        if (state.communityLookupStatus == StateStatus.loaded &&
            _prevLookupStatus != StateStatus.loaded) {
          HapticFeedback.lightImpact();
          context.pushReplacement(AppRoutes.signUpVolunteer);
        }

        _prevLookupStatus = state.communityLookupStatus;
        _prevLookupError = state.communityLookupError;
      },
      builder: (context, state) {
        final isLoading = state.communityLookupStatus == StateStatus.loading;

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
            title: Text(
              'Join a Community',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),

                      // Key Icon Wrap
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: context.appGradients.primary,
                          boxShadow: [
                            BoxShadow(
                              color: colors.primary.withValues(alpha: 0.28),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.vpn_key_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Title & Subtitle
                      Text(
                        'Enter your invite code',
                        textAlign: TextAlign.center,
                        style: typography.titleLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.textPrimary,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Check the invitation email from your community admin — it has a 6-character code.',
                        textAlign: TextAlign.center,
                        style: typography.bodyMedium.copyWith(
                          color: colors.text4,
                          fontSize: 13.5,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Code Box Label
                      Text(
                        'Community Code',
                        style: typography.labelLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                      MaterialPinField(
                        pinController: controller,
                        length: 6,
                        onCompleted: (pin) => _onContinuePressed(context),
                        keyboardType: .text,
                        theme: MaterialPinTheme(
                          shape: MaterialPinShape.outlined,
                          cellSize: Size(44, 56),
                          borderRadius: BorderRadius.circular(16),
                          focusedFillColor: Colors.black.withValues(
                            alpha: 0.04,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Code format tip
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Codes look like ',
                            style: typography.caption.copyWith(
                              color: colors.text4,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'GC8420',
                            style: typography.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            ' — not case sensitive',
                            style: typography.caption.copyWith(
                              color: colors.text4,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // Continue Button
                      AppButton(
                        width: double.infinity,
                        onPressed: isLoading
                            ? null
                            : () => _onContinuePressed(context),
                        isLoading: isLoading,
                        text: isLoading ? 'Searching...' : 'Continue',
                        color: colors.primary,
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),

                      const SizedBox(height: 32),

                      // Need Help Divider
                      Row(
                        children: [
                          Expanded(
                            child: Container(height: 1, color: colors.border),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'NEED HELP',
                              style: typography.labelSmall.copyWith(
                                color: colors.text4,
                                fontWeight: FontWeight.w800,
                                fontSize: 10.5,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(height: 1, color: colors.border),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Help Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colors.card,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: colors.border),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.surfaceLight,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.help_outline_rounded,
                                  size: 16,
                                  color: colors.text4,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "Don't have a code? Ask your community's admin to send you an invitation — they can do this from Add Volunteers in their app.",
                                style: typography.bodyMedium.copyWith(
                                  color: colors.textSecondary,
                                  fontSize: 12.5,
                                  height: 1.45,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
