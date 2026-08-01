import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/account_setup_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart';

class AddVolunteerBottomSheet extends StatefulWidget {
  const AddVolunteerBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    final volunteerBloc = context.read<VolunteerBloc>();
    final communityBloc = context.read<CommunityBloc>();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: volunteerBloc),
          BlocProvider.value(value: communityBloc),
        ],
        child: const AddVolunteerBottomSheet(),
      ),
    );
  }

  @override
  State<AddVolunteerBottomSheet> createState() =>
      _AddVolunteerBottomSheetState();
}

class _AddVolunteerBottomSheetState extends State<AddVolunteerBottomSheet> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _onSubmit(BuildContext context) {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

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

    if (password.isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter password for volunteer');
      return;
    }

    if (password.length < 6) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Password must be at least 6 characters');
      return;
    }

    final communityId =
        context.read<CommunityBloc>().state.community?.id ?? '';

    if (communityId.isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Community information not available');
      return;
    }

    final volunteer = AppUser(
      id: '',
      email: email,
      displayName: name,
      role: 'volunteer',
      communityId: communityId,
      accountSetupStatus: AccountSetupStatus.adminRegistered,
    );

    context.read<VolunteerBloc>().add(
          VolunteerEvent.addVolunteerRequested(
            volunteer: volunteer,
            communityId: communityId,
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
          Navigator.of(context).pop();
        }

        _prevActionStatus = state.volunteerActionStatus;
        _prevActionError = state.volunteerActionError;
      },
      builder: (context, state) {
        final isLoading =
            state.volunteerActionStatus == StateStatus.loading;

        return Container(
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
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

                // Top Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Volunteer',
                      style: typography.headlineSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: colors.textPrimary,
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
                  'Create an account for a new volunteer to join your community.',
                  style: typography.bodyMedium.copyWith(
                    color: colors.text4,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),

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
                const SizedBox(height: 16),

                // Password Field
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter initial password',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 24),

                // Submit Button
                AppButton(
                  width: double.infinity,
                  onPressed: isLoading ? null : () => _onSubmit(context),
                  isLoading: isLoading,
                  text: isLoading ? 'Adding Volunteer...' : 'Add Volunteer',
                  color: colors.primary,
                  icon: Icon(
                    Icons.person_add_alt_1_rounded,
                    color: colors.white,
                  ),
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
