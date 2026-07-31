import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/community/domain/models/address.dart';
import 'package:ganesh_chanda/features/community/domain/models/community.dart';
import 'package:ganesh_chanda/features/community/domain/models/contact.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController(text: 'India');
  final _pincodeController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  StateStatus _prevStatus = StateStatus.initial;
  String? _prevError;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _pincodeController.dispose();
    _contactNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onCreateCommunityPressed(BuildContext context) {
    if (_nameController.text.trim().isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter community name');
      return;
    }
    if (_addressController.text.trim().isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter street address');
      return;
    }
    if (_cityController.text.trim().isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter city');
      return;
    }
    if (_stateController.text.trim().isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter state');
      return;
    }
    if (_contactNameController.text.trim().isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter contact name');
      return;
    }

    final phoneText = _phoneController.text.trim();
    if (phoneText.isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter contact phone number');
      return;
    }

    final emailText = _emailController.text.trim();
    if (emailText.isNotEmpty) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(emailText)) {
        HapticFeedback.mediumImpact();
        showErrorToast(message: 'Please enter a valid email address');
        return;
      }
    }

    final community = Community(
      id: '',
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      address: Address(
        street: _addressController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        country: _countryController.text.trim().isEmpty
            ? 'India'
            : _countryController.text.trim(),
        pinCode: _pincodeController.text.trim(),
      ),
      contact: Contact(
        name: _contactNameController.text.trim(),
        phone: phoneText,
        email: emailText,
      ),
      createdBy: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    context.read<CommunityBloc>().add(
      CommunityEvent.createCommunityRequested(community: community),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocConsumer<CommunityBloc, CommunityState>(
      listener: (context, state) {
        if (state.communityStatus == StateStatus.error &&
            state.communityError != null &&
            state.communityError != _prevError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: state.communityError!);
        }
        if (state.communityStatus == StateStatus.loaded &&
            _prevStatus != StateStatus.loaded) {
          HapticFeedback.lightImpact();
          context.push(AppRoutes.festivalsHome);
        }
        _prevStatus = state.communityStatus;
        _prevError = state.communityError;
      },
      builder: (context, state) {
        final isLoading = state.communityStatus == StateStatus.loading;

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
              'Create Your Community',
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Step Indicator
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF16A34A),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                color: colors.primary,
                              ),
                            ),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: context.appGradients.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.primary.withValues(
                                      alpha: 0.28,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
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
                          'STEP 2 OF 2',
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
                          'Tell us about your committee',
                          style: typography.titleLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textPrimary,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Subtitle
                        Text(
                          "This becomes your community's home on Ganesh Chanda. You can update it anytime from Settings.",
                          style: typography.bodyMedium.copyWith(
                            color: colors.text4,
                            fontSize: 13.5,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Committee Logo Section
                        Text(
                          'Committee Logo (optional)',
                          style: typography.labelLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: colors.surfaceLight,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: colors.border,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.upload_file_rounded,
                                color: colors.primary,
                                size: 30,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Upload logo',
                                style: typography.titleMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colors.textPrimary,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Square image works best',
                                style: typography.caption.copyWith(
                                  color: colors.text4,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Community Name
                        AppTextField(
                          controller: _nameController,
                          labelText: 'Community Name',
                          hintText: 'e.g. Shivaji Nagar Ganesh Mandal',
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),

                        // Description Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description (optional)',
                              style: typography.labelLarge.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _descriptionController,
                              maxLines: 3,
                              textInputAction: TextInputAction.next,
                              style: typography.bodyMedium.copyWith(
                                color: colors.textPrimary,
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    'A short introduction for your donors and volunteers...',
                                hintStyle: typography.bodyMedium.copyWith(
                                  color: colors.text4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Address Field
                        AppTextField(
                          controller: _addressController,
                          labelText: 'Address',
                          hintText: 'Street / area / landmark',
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),

                        // City & State Row
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                controller: _cityController,
                                labelText: 'City',
                                hintText: 'City',
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppTextField(
                                controller: _stateController,
                                labelText: 'State',
                                hintText: 'State',
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Country & Pincode Row
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                controller: _countryController,
                                labelText: 'Country',
                                hintText: 'Country',
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppTextField(
                                controller: _pincodeController,
                                labelText: 'Pincode',
                                hintText: 'e.g. 411001',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Divider / Section Title for Contact Information
                        Row(
                          children: [
                            Text(
                              'CONTACT INFORMATION',
                              style: typography.labelSmall.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(height: 1, color: colors.border),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Contact Name
                        AppTextField(
                          controller: _contactNameController,
                          labelText: 'Contact Name',
                          hintText: 'e.g. Rahul Sharma',
                          textInputAction: TextInputAction.next,
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Contact Phone & Email Row
                        AppTextField(
                          controller: _phoneController,
                          labelText: 'Contact Phone Number',
                          hintText: 'e.g. 9876543210',
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: colors.text4,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 20),

                        AppTextField(
                          controller: _emailController,
                          labelText: 'Contact Email Address',
                          hintText: 'contact@mandal.org',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Create Community Primary Button
                        AppButton(
                          width: double.infinity,
                          onPressed: isLoading
                              ? null
                              : () => _onCreateCommunityPressed(context),
                          isLoading: isLoading,
                          text: isLoading ? 'Creating...' : 'Create Community',
                          color: colors.primary,
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
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
