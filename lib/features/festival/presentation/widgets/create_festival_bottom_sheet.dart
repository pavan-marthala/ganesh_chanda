import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival_status.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';

class CreateFestivalBottomSheet extends StatefulWidget {
  const CreateFestivalBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    final festivalBloc = context.read<FestivalBloc>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: festivalBloc,
        child: const CreateFestivalBottomSheet(),
      ),
    );
  }

  @override
  State<CreateFestivalBottomSheet> createState() =>
      _CreateFestivalBottomSheetState();
}

class _CreateFestivalBottomSheetState
    extends State<CreateFestivalBottomSheet> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final initialDate = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          _startDateController.text =
              '${picked.day} ${_monthName(picked.month)} ${picked.year}';
        } else {
          _endDate = picked;
          _endDateController.text =
              '${picked.day} ${_monthName(picked.month)} ${picked.year}';
        }
      });
    }
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  void _onSubmit(BuildContext context) {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please enter festival name');
      return;
    }

    if (_startDate == null) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please select start date');
      return;
    }

    if (_endDate == null) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'Please select end date');
      return;
    }

    if (_endDate!.isBefore(_startDate!)) {
      HapticFeedback.mediumImpact();
      showErrorToast(message: 'End date cannot be before start date');
      return;
    }

    final festival = Festival(
      id: '',
      communityId: '',
      name: name,
      description: _descriptionController.text.trim(),
      startDate: _startDate!,
      endDate: _endDate!,
      status: FestivalStatus.upcoming,
      createdBy: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    context.read<FestivalBloc>().add(
          FestivalEvent.createFestivalRequested(festival: festival),
        );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<FestivalBloc, FestivalState>(
      listener: (context, state) {
        if (state.festivalActionStatus == StateStatus.error &&
            state.festivalActionError != null &&
            state.festivalActionError != _prevActionError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: state.festivalActionError!);
        }

        if (state.festivalActionStatus == StateStatus.loaded &&
            _prevActionStatus == StateStatus.loading) {
          HapticFeedback.lightImpact();
          Navigator.of(context).pop();
        }

        _prevActionStatus = state.festivalActionStatus;
        _prevActionError = state.festivalActionError;
      },
      builder: (context, state) {
        final isLoading =
            state.festivalActionStatus == StateStatus.loading;

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
                      'Create Festival',
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
                const SizedBox(height: 20),

                // Festival Banner Upload Container
                Text(
                  'Festival Banner (optional)',
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
                    vertical: 24,
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
                        'Upload banner image',
                        style: typography.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Shown on the Festivals Home & donation page',
                        style: typography.caption.copyWith(
                          color: colors.text4,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Festival Name Field
                AppTextField(
                  controller: _nameController,
                  labelText: 'Festival Name',
                  hintText: 'e.g. Ganesh Chaturthi 2026',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),

                // Start & End Date Row
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: AbsorbPointer(
                          child: AppTextField(
                            controller: _startDateController,
                            labelText: 'Start Date',
                            hintText: '14 Sep 2026',
                            prefixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: colors.text4,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: AbsorbPointer(
                          child: AppTextField(
                            controller: _endDateController,
                            labelText: 'End Date',
                            hintText: '23 Sep 2026',
                            prefixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: colors.text4,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      textInputAction: TextInputAction.done,
                      style: typography.bodyMedium.copyWith(
                        color: colors.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText:
                            'Tell donors and volunteers what this festival is about...',
                        hintStyle: typography.bodyMedium.copyWith(
                          color: colors.text4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Create Festival Submit Button
                AppButton(
                  width: double.infinity,
                  onPressed: isLoading ? null : () => _onSubmit(context),
                  isLoading: isLoading,
                  text: isLoading ? 'Creating...' : 'Create Festival',
                  color: colors.primary,
                  icon: Icon(
                    Icons.arrow_forward_rounded,
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
