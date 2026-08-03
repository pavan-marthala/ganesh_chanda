import 'package:flutter/material.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/payment_mode.dart';

class PaymentMethodSelector extends StatelessWidget {
  final PaymentMode selectedMode;
  final ValueChanged<PaymentMode> onChanged;
  final String? label;

  const PaymentMethodSelector({
    super.key,
    required this.selectedMode,
    required this.onChanged,
    this.label = 'Payment Method',
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          Text(
            label!,
            style: typography.titleMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.textSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
        ],
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
                context: context,
                label: 'Cash',
                mode: PaymentMode.cash,
                icon: Icons.payments_outlined,
              ),
              _buildPaymentSegment(
                context: context,
                label: 'UPI',
                mode: PaymentMode.upi,
                icon: Icons.qr_code_scanner_rounded,
              ),
              _buildPaymentSegment(
                context: context,
                label: 'Bank',
                mode: PaymentMode.bankTransfer,
                icon: Icons.account_balance_outlined,
              ),
              _buildPaymentSegment(
                context: context,
                label: 'Cheque',
                mode: PaymentMode.cheque,
                icon: Icons.receipt_long_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentSegment({
    required BuildContext context,
    required String label,
    required PaymentMode mode,
    required IconData icon,
  }) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final isSelected = selectedMode == mode;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(mode),
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
