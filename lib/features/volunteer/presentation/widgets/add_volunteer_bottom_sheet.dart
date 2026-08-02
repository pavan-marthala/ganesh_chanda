import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/community/domain/models/community.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/screens/festivals_home_screen.dart';
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart';

class AddVolunteerBottomSheet extends StatefulWidget {
  const AddVolunteerBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => const AddVolunteerBottomSheet(),
    );
  }

  @override
  State<AddVolunteerBottomSheet> createState() =>
      _AddVolunteerBottomSheetState();
}

class _AddVolunteerBottomSheetState extends State<AddVolunteerBottomSheet> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;
  late final Community community;

  @override
  initState() {
    community = context.read<CommunityBloc>().state.community!;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _onSubmit(BuildContext context) {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    if (name.isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter volunteer name');
      return;
    }

    if (email.isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter volunteer email');
      return;
    }

    if (!_isValidEmail(email)) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter a valid email address');
      return;
    }

    context.read<VolunteerBloc>().add(
      VolunteerEvent.sendInvite(
        to: email,
        subject: "You're invited to — Ganesh Chanda",
        path: 'assets/html_templates/volunteer-invite-email.html',
        parameters: {
          "volunteer_name": name,
          "volunteer_email": email,
          "community_id": community.communityCode,
          "community_name": community.name,
          "community_initials": getInitials(community.name),
          "community_city": community.address?.city ?? "",
          "community_state": community.address?.state ?? "",
          "invite_link": "#",
          "current_year": DateTime.now().year.toString(),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<VolunteerBloc, VolunteerState>(
      listener: (context, state) {
        if (state.volunteerActionStatus == StateStatus.error &&
            state.volunteerActionError != null &&
            state.volunteerActionError != _prevActionError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: state.volunteerActionError!);
        }

        if (state.volunteerActionStatus == StateStatus.loaded &&
            _prevActionStatus == StateStatus.loading) {
          HapticFeedback.lightImpact();
          showSuccessToast(message: 'Invite sent successfully');
          Navigator.of(context).pop();
        }

        _prevActionStatus = state.volunteerActionStatus;
        _prevActionError = state.volunteerActionError;
      },
      builder: (context, state) {
        final isLoading = state.volunteerActionStatus == StateStatus.loading;

        return Container(
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: colors.black.withValues(
                  alpha: context.isDark ? 0.4 : 0.15,
                ),
                blurRadius: 32,
                offset: const Offset(0, -8),
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 24 + bottomInset,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sheet Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: colors.border,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: colors.primary.withValues(alpha: 0.10),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.send_rounded,
                              color: colors.primary,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Send Invitation',
                              style: typography.headlineSmall.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: colors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colors.surfaceLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.border),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.close_rounded,
                          color: colors.textPrimary,
                          size: 18,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  "Invite someone to volunteer for ${community.name}. They'll get an email "
                  "with a join code to set up their own account.",
                  style: typography.bodyMedium.copyWith(
                    color: colors.text4,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colors.primary.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HOW IT WORKS',
                        style: typography.bodySmall.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w800,
                          fontSize: 10.5,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _InviteStep(
                        icon: Icons.mark_email_read_outlined,
                        title: 'We email them an invite',
                        description:
                            "They'll receive a join code for ${community.name}.",
                        colors: colors,
                        typography: typography,
                      ),
                      _InviteStepDivider(colors: colors),
                      _InviteStep(
                        icon: Icons.how_to_reg_outlined,
                        title: 'They create their own account',
                        description:
                            'Using the code, they sign up and set a password.',
                        colors: colors,
                        typography: typography,
                      ),
                      _InviteStepDivider(colors: colors),
                      _InviteStep(
                        icon: Icons.groups_outlined,
                        title: 'They join automatically',
                        description:
                            'Once verified, they appear in your volunteer list — ready to be assigned.',
                        colors: colors,
                        typography: typography,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Volunteer Name Field
                AppTextField(
                  controller: _nameController,
                  labelText: 'Volunteer Name',
                  hintText: 'e.g. Rahul Sharma',
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 16),

                // Volunteer Email Field
                AppTextField(
                  controller: _emailController,
                  labelText: 'Volunteer Email',
                  hintText: 'e.g. rahul@example.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: colors.text4,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 14,
                      color: colors.text4,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "They won't be added until they accept the invite and create their account.",
                        style: typography.bodySmall.copyWith(
                          color: colors.text4,
                          fontSize: 11.5,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AppButton(
                  width: double.infinity,
                  onPressed: isLoading ? null : () => _onSubmit(context),
                  isLoading: isLoading,
                  text: isLoading ? 'Sending Invite...' : 'Send Invite',
                  color: colors.primary,
                  icon: Icon(Icons.send_rounded, color: colors.white),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// A single row inside the "How it works" info card.
class _InviteStep extends StatelessWidget {
  const _InviteStep({
    required this.icon,
    required this.title,
    required this.description,
    required this.colors,
    required this.typography,
    this.isLast = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final dynamic colors;
  final dynamic typography;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.card,
            shape: BoxShape.circle,
            border: Border.all(color: colors.primary.withValues(alpha: 0.25)),
          ),
          child: Icon(icon, size: 14, color: colors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: typography.bodyMedium.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: typography.bodySmall.copyWith(
                    color: colors.text4,
                    fontSize: 11.5,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Thin connecting line between invite steps.
class _InviteStepDivider extends StatelessWidget {
  const _InviteStepDivider({required this.colors});

  final dynamic colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.5),
      child: Container(
        width: 1,
        height: 16,
        color: colors.primary.withValues(alpha: 0.20),
      ),
    );
  }
}
