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
import 'package:ganesh_chanda/features/festival/domain/models/payment_details.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:intl/intl.dart';

class CreateFestivalBottomSheet extends StatefulWidget {
  final Festival? festival;

  const CreateFestivalBottomSheet({
    super.key,
    this.festival,
  });

  static Future<void> show(BuildContext context, {Festival? festival}) {
    final festivalBloc = context.read<FestivalBloc>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (sheetContext) => BlocProvider.value(
        value: festivalBloc,
        child: CreateFestivalBottomSheet(festival: festival),
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
  final _goalController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  // Payment Details Controllers
  final _upiIdController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _accountHolderNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _ifscCodeController = TextEditingController();
  final _chequePayeeNameController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;

  final DateFormat _dateFormat = DateFormat('d MMM yyyy');

  bool get _isEditMode => widget.festival != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      final f = widget.festival!;
      _nameController.text = f.name;
      _descriptionController.text = f.description;
      _goalController.text = f.goal > 0 ? f.goal.toStringAsFixed(0) : '';

      _startDate = f.startDate;
      _startDateController.text = _dateFormat.format(f.startDate);

      _endDate = f.endDate;
      _endDateController.text = _dateFormat.format(f.endDate);

      final p = f.paymentDetails;
      if (p != null) {
        _upiIdController.text = p.upiId;
        _bankNameController.text = p.bankName;
        _accountHolderNameController.text = p.accountHolderName;
        _accountNumberController.text = p.accountNumber;
        _ifscCodeController.text = p.ifscCode;
        _chequePayeeNameController.text = p.chequePayeeName;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _goalController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _upiIdController.dispose();
    _bankNameController.dispose();
    _accountHolderNameController.dispose();
    _accountNumberController.dispose();
    _ifscCodeController.dispose();
    _chequePayeeNameController.dispose();
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
          _startDateController.text = _dateFormat.format(picked);
        } else {
          _endDate = picked;
          _endDateController.text = _dateFormat.format(picked);
        }
      });
    }
  }

  FestivalStatus _calculateStatus(DateTime startDate, DateTime endDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startDay = DateTime(startDate.year, startDate.month, startDate.day);
    final endDay = DateTime(endDate.year, endDate.month, endDate.day);

    if (startDay.isAfter(today)) {
      return FestivalStatus.upcoming;
    } else if (endDay.isBefore(today)) {
      return FestivalStatus.completed;
    } else {
      return FestivalStatus.active;
    }
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

    final goalText = _goalController.text.trim();
    double goalAmount = 0.0;
    if (goalText.isNotEmpty) {
      final parsedGoal = double.tryParse(goalText);
      if (parsedGoal == null || parsedGoal < 0) {
        HapticFeedback.mediumImpact();
        showErrorToast(message: 'Please enter a valid donation goal');
        return;
      }
      goalAmount = parsedGoal;
    }

    final paymentDetails = PaymentDetails(
      upiId: _upiIdController.text.trim(),
      bankName: _bankNameController.text.trim(),
      accountHolderName: _accountHolderNameController.text.trim(),
      accountNumber: _accountNumberController.text.trim(),
      ifscCode: _ifscCodeController.text.trim(),
      chequePayeeName: _chequePayeeNameController.text.trim(),
    );

    final calculatedStatus = _calculateStatus(_startDate!, _endDate!);

    if (_isEditMode) {
      final updatedFestival = widget.festival!.copyWith(
        name: name,
        goal: goalAmount,
        description: _descriptionController.text.trim(),
        startDate: _startDate!,
        endDate: _endDate!,
        status: calculatedStatus,
        paymentDetails: paymentDetails,
        updatedAt: DateTime.now(),
      );

      context.read<FestivalBloc>().add(
            FestivalEvent.updateFestivalRequested(
              festival: updatedFestival,
              communityId: updatedFestival.communityId,
            ),
          );
    } else {
      final newFestival = Festival(
        id: '',
        communityId: '',
        name: name,
        goal: goalAmount,
        description: _descriptionController.text.trim(),
        startDate: _startDate!,
        endDate: _endDate!,
        status: calculatedStatus,
        paymentDetails: paymentDetails,
        createdBy: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      context.read<FestivalBloc>().add(
            FestivalEvent.createFestivalRequested(festival: newFestival),
          );
    }
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
          showSuccessToast(
            message: _isEditMode
                ? 'Festival Updated Successfully!'
                : 'Festival Created Successfully!',
          );
          Navigator.of(context).pop();
        }

        _prevActionStatus = state.festivalActionStatus;
        _prevActionError = state.festivalActionError;
      },
      builder: (context, state) {
        final isLoading =
            state.festivalActionStatus == StateStatus.loading;

        final titleText = _isEditMode ? 'Edit Festival' : 'Create Festival';
        final buttonText = isLoading
            ? (_isEditMode ? 'Updating...' : 'Creating...')
            : (_isEditMode ? 'Update Festival' : 'Create Festival');

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
                      titleText,
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

                // Donation Goal Field
                AppTextField(
                  controller: _goalController,
                  labelText: 'Donation Goal (₹)',
                  hintText: 'e.g. 500000',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  prefixIcon: Icon(
                    Icons.currency_rupee_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
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

                // Payment Details Section Header
                Row(
                  children: [
                    Expanded(child: Divider(color: colors.border)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Payment Details (optional)',
                        style: typography.titleMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: colors.border)),
                  ],
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _upiIdController,
                  labelText: 'UPI ID',
                  hintText: 'e.g. ganeshchanda@upi',
                  prefixIcon: Icon(
                    Icons.qr_code_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  controller: _bankNameController,
                  labelText: 'Bank Name',
                  hintText: 'e.g. State Bank of India',
                  prefixIcon: Icon(
                    Icons.account_balance_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _accountHolderNameController,
                  labelText: 'Account Holder Name',
                  hintText: 'e.g. Ganesh Chanda Samiti',
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _accountNumberController,
                  labelText: 'Account Number',
                  hintText: 'e.g. 1234567890',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(
                    Icons.numbers_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _ifscCodeController,
                  labelText: 'IFSC Code',
                  hintText: 'e.g. SBIN0001234',
                  prefixIcon: Icon(
                    Icons.code_rounded,
                    color: colors.text4,
                    size: 18,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  controller: _chequePayeeNameController,
                  labelText: 'Cheque Payee Name',
                  hintText: 'e.g. Payable to Ganesh Chanda Samiti',
                  prefixIcon: Icon(
                    Icons.badge_outlined,
                    color: colors.text4,
                    size: 18,
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 28),

                AppButton(
                  width: double.infinity,
                  onPressed: isLoading ? null : () => _onSubmit(context),
                  isLoading: isLoading,
                  text: buttonText,
                  color: colors.primary,
                  icon: Icon(
                    _isEditMode
                        ? Icons.check_rounded
                        : Icons.arrow_forward_rounded,
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
