import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/app_utils.dart';
import 'package:ganesh_chanda/core/utils/sized_context.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/payment_mode.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_category.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_status.dart';
import 'package:ganesh_chanda/features/expense/domain/models/expense.dart';
import 'package:ganesh_chanda/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';

class AddExpenseBottomSheet extends StatefulWidget {
  const AddExpenseBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      builder: (sheetContext) => AddExpenseBottomSheet(),
    );
  }

  @override
  State<AddExpenseBottomSheet> createState() => _AddExpenseBottomSheetState();
}

class _AddExpenseBottomSheetState extends State<AddExpenseBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _paidToController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  ExpenseCategory _selectedCategory = ExpenseCategory.decoration;
  PaymentMode _selectedPaymentMode = PaymentMode.cash;

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _paidToController.dispose();
    _referenceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _onSaveExpense(BuildContext context) {
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

    final expense = Expense(
      id: '',
      festivalId: festivalId,
      communityId: communityId,
      title: _titleController.text.trim(),
      description: _notesController.text.trim(),
      amount: amount,
      category: _selectedCategory,
      paymentMode: _selectedPaymentMode,
      referenceNumber: _selectedPaymentMode != PaymentMode.cash
          ? _referenceController.text.trim()
          : null,
      paidTo: _paidToController.text.trim(),
      paidBy: '',
      status: ExpenseStatus.paid,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    context.read<ExpenseBloc>().add(
      ExpenseEvent.createExpenseRequested(expense: expense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocConsumer<ExpenseBloc, ExpenseState>(
      listener: (context, expenseState) {
        if (expenseState.expenseActionStatus == StateStatus.loaded &&
            _prevActionStatus == StateStatus.loading) {
          HapticFeedback.lightImpact();
          showSuccessToast(message: 'Expense Recorded Successfully!');
          Navigator.of(context).pop();
        } else if (expenseState.expenseActionStatus == StateStatus.error &&
            expenseState.expenseActionError != null &&
            expenseState.expenseActionError != _prevActionError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: expenseState.expenseActionError!);
        }

        _prevActionStatus = expenseState.expenseActionStatus;
        _prevActionError = expenseState.expenseActionError;
      },
      builder: (context, expenseState) {
        final isLoading =
            expenseState.expenseActionStatus == StateStatus.loading;

        return Container(
          constraints: BoxConstraints(maxHeight: context.heightPx * 0.95),
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
                      'Add Expense',
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
                  padding: EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    20 + context.viewInsets.bottom,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Reusable Category Selector using AppUtils
                        Text(
                          'Category',
                          style: typography.labelLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: context.widthPx < 450 ? 1.5 : 2.05,
                          children: ExpenseCategory.values.map((cat) {
                            final isSelected = _selectedCategory == cat;
                            final accentColor = getCategoryIconColor(
                              context,
                              cat,
                            );
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = cat;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? accentColor.withValues(alpha: 0.12)
                                      : colors.card,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? accentColor
                                        : colors.border,
                                    width: isSelected ? 1.5 : 1,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: accentColor.withValues(
                                              alpha: 0.20,
                                            ),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4),
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      getCategoryIcon(cat),
                                      size: 22,
                                      color: isSelected
                                          ? accentColor
                                          : colors.textTertiary,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      getCategoryDisplayName(cat),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: typography.titleSmall.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11.5,
                                        color: isSelected
                                            ? accentColor
                                            : colors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          controller: _titleController,
                          labelText: 'Expense Title',
                          hintText: 'e.g. Flower Decoration',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter expense title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Amount
                        AppTextField(
                          controller: _amountController,
                          labelText: 'Amount',
                          hintText: '0',
                          keyboardType: TextInputType.number,
                          prefixIcon: Icon(
                            Icons.currency_rupee_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter amount';
                            }
                            final amount = double.tryParse(value.trim());
                            if (amount == null || amount <= 0) {
                              return 'Enter a valid amount';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        AppTextField(
                          controller: _paidToController,
                          labelText: 'Paid To (vendor)',
                          hintText: 'Vendor / shop name',
                          prefixIcon: Icon(
                            Icons.storefront_rounded,
                            color: colors.text4,
                            size: 20,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter vendor or payee name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

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

                        AppTextField(
                          controller: _notesController,
                          labelText: 'Notes (optional)',
                          hintText: 'Additional notes...',
                          validator: (_) => null,
                        ),
                        const SizedBox(height: 24),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.secondary,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 52),
                            shape: const StadiumBorder(),
                            elevation: 4,
                          ),
                          onPressed: isLoading
                              ? null
                              : () => _onSaveExpense(context),
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
                                      'Save Expense',
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
