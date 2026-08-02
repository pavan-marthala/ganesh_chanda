import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/sized_context.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/donation_status.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/payment_mode.dart';
import 'package:ganesh_chanda/features/donation/domain/models/donation.dart';
import 'package:ganesh_chanda/features/donation/presentation/bloc/donation_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';

class AddDonationBottomSheet extends StatefulWidget {
  const AddDonationBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => AddDonationBottomSheet(),
    );
  }

  @override
  State<AddDonationBottomSheet> createState() => _AddDonationBottomSheetState();
}

class _AddDonationBottomSheetState extends State<AddDonationBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _donorNameController = TextEditingController();
  final TextEditingController _donorPhoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController(
    text: '2100',
  );
  final TextEditingController _referenceController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  PaymentMode _selectedPaymentMode = PaymentMode.cash;
  int? _selectedQuickAmount = 2100;

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;

  @override
  void dispose() {
    _donorNameController.dispose();
    _donorPhoneController.dispose();
    _amountController.dispose();
    _referenceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _onQuickAmountSelected(int amount) {
    setState(() {
      _selectedQuickAmount = amount;
      _amountController.text = '$amount';
    });
  }

  void _onSaveDonation(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final festival = context.read<FestivalBloc>().state.festival;
    final community = context.read<CommunityBloc>().state.community;

    final festivalId = festival?.id ?? '';
    final communityId = community?.id ?? festival?.communityId ?? '';

    if (festivalId.isEmpty) {
      showErrorToast(message: 'No active festival selected.');
      return;
    }

    final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;

    final donation = Donation(
      id: '',
      festivalId: festivalId,
      communityId: communityId,
      donorName: _donorNameController.text.trim(),
      donorPhone: _donorPhoneController.text.trim(),
      amount: amount,
      paymentMode: _selectedPaymentMode,
      referenceNumber: _selectedPaymentMode != PaymentMode.cash
          ? _referenceController.text.trim()
          : null,
      notes: _notesController.text.trim(),
      collectedBy: '',
      status: DonationStatus.received,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    context.read<DonationBloc>().add(
      DonationEvent.createDonationRequested(donation: donation),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    // final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<DonationBloc, DonationState>(
      listener: (context, donationState) {
        if (donationState.donationActionStatus == StateStatus.loaded &&
            _prevActionStatus == StateStatus.loading) {
          HapticFeedback.lightImpact();
          showSuccessToast(message: 'Donation Recorded Successfully!');
          Navigator.of(context).pop();
        } else if (donationState.donationActionStatus == StateStatus.error &&
            donationState.donationActionError != null &&
            donationState.donationActionError != _prevActionError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: donationState.donationActionError!);
        }

        _prevActionStatus = donationState.donationActionStatus;
        _prevActionError = donationState.donationActionError;
      },
      builder: (context, donationState) {
        final isLoading =
            donationState.donationActionStatus == StateStatus.loading;

        return Container(
          constraints: BoxConstraints(maxHeight: context.heightPx * 0.9),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handlebar
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 12),

              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: colors.border)),
                ),
                child: Row(
                  children: [
                    Container(
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
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      'Add Donation',
                      style: typography.headlineSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + context.viewInsets.bottom),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Donor Name
                        AppTextField(
                          controller: _donorNameController,
                          labelText: 'Donor Name',
                          hintText: 'Enter full name',
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter donor name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Phone Number
                        AppTextField(
                          controller: _donorPhoneController,
                          labelText: 'Phone Number',
                          hintText: '+91 98765 43210',
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: colors.text4,
                            size: 20,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter phone number';
                            }
                            if (value.trim().length < 10) {
                              return 'Enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Donation Amount
                        AppTextField(
                          controller: _amountController,
                          labelText: 'Donation Amount',
                          hintText: '0',
                          keyboardType: TextInputType.number,
                          prefixIcon: Icon(
                            Icons.currency_rupee_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                          onChanged: (val) {
                            final parsed = int.tryParse(val.trim());
                            setState(() {
                              _selectedQuickAmount = parsed;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter donation amount';
                            }
                            final amount = double.tryParse(value.trim());
                            if (amount == null || amount <= 0) {
                              return 'Enter a valid amount';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Quick Amount Chips
                        Row(
                          children: [501, 1100, 2100, 5100].map((amt) {
                            final isSelected = _selectedQuickAmount == amt;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => _onQuickAmountSelected(amt),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? colors.primary.withValues(alpha: 0.08)
                                        : colors.surfaceLight,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected
                                          ? colors.primary
                                          : colors.border,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    '₹$amt',
                                    textAlign: TextAlign.center,
                                    style: typography.titleSmall.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: isSelected
                                          ? colors.primary
                                          : colors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),

                        // Payment Method Selector
                        Text(
                          'Payment Method',
                          style: typography.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: colors.surfaceLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: colors.border),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              _buildPaymentSegment(
                                label: 'Cash',
                                mode: PaymentMode.cash,
                                icon: Icons.payments_outlined,
                              ),
                              _buildPaymentSegment(
                                label: 'UPI',
                                mode: PaymentMode.upi,
                                icon: Icons.qr_code_scanner_rounded,
                              ),
                              _buildPaymentSegment(
                                label: 'Bank',
                                mode: PaymentMode.bankTransfer,
                                icon: Icons.account_balance_outlined,
                              ),
                              _buildPaymentSegment(
                                label: 'Cheque',
                                mode: PaymentMode.cheque,
                                icon: Icons.receipt_long_outlined,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Conditional QR Code Card for UPI
                        if (_selectedPaymentMode == PaymentMode.upi) ...[
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: context.appGradients.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: colors.primary.withValues(alpha: 0.25),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'SCAN TO PAY',
                                  style: typography.labelSmall.copyWith(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.2,
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Shree Ganesh Utsav Mandal',
                                  style: typography.titleLarge.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Container(
                                  width: 170,
                                  height: 170,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(
                                    Icons.qr_code_2_rounded,
                                    size: 146,
                                    color: colors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                const Text(
                                  'ganeshutsav@upi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ask donor to scan & pay, then confirm below',
                                  style: typography.caption.copyWith(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],

                        // Conditional Reference Number Field (UPI, Bank, Cheque)
                        if (_selectedPaymentMode != PaymentMode.cash) ...[
                          AppTextField(
                            controller: _referenceController,
                            labelText: 'Reference Number',
                            hintText: 'e.g. 4yr77-hd / UTR Number',
                            prefixIcon: Icon(
                              Icons.tag_rounded,
                              color: colors.text4,
                              size: 20,
                            ),
                            validator: (value) {
                              if (_selectedPaymentMode != PaymentMode.cash) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Reference number is required for ${_selectedPaymentMode.name.toUpperCase()}';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Notes Field
                        AppTextField(
                          controller: _notesController,
                          labelText: 'Notes (optional)',
                          hintText: 'Any notes about this donation...',
                          validator: (_) => null,
                        ),
                        const SizedBox(height: 24),

                        // Submit Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 52),
                            shape: const StadiumBorder(),
                            elevation: 4,
                          ),
                          onPressed: isLoading
                              ? null
                              : () => _onSaveDonation(context),
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.check_rounded, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Confirm Payment Received',
                                      style: typography.titleMedium.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 15,
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
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentSegment({
    required String label,
    required PaymentMode mode,
    required IconData icon,
  }) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final isSelected = _selectedPaymentMode == mode;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPaymentMode = mode;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? colors.card : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colors.black.withValues(alpha: 0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isSelected ? colors.primary : colors.text4,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: typography.titleSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: isSelected ? colors.primary : colors.text4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
