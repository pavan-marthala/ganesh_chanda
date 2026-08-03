import 'package:flutter/material.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/features/donation/domain/models/donation.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_category.dart';
import 'package:ganesh_chanda/generated/assets.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

String formatAmount(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}
String formatAmountINRupee(double amount) {
  if (amount >= 100000) {
    final inLakhs = amount / 100000;
    return '₹${inLakhs.toStringAsFixed(inLakhs.truncateToDouble() == inLakhs ? 0 : 1)}L';
  } else if (amount >= 1000) {
    final inThousands = amount / 1000;
    return '₹${inThousands.toStringAsFixed(inThousands.truncateToDouble() == inThousands ? 0 : 1)}K';
  }
  return '₹${amount.toStringAsFixed(0)}';
}

String getCategoryDisplayName(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.decoration:
      return 'Decoration';
    case ExpenseCategory.food:
      return 'Food & Prasad';
    case ExpenseCategory.pooja:
      return 'Puja Samagri';
    case ExpenseCategory.sound:
      return 'Sound System';
    case ExpenseCategory.lighting:
      return 'Lighting';
    case ExpenseCategory.tent:
      return 'Tent & Mandap';
    case ExpenseCategory.transport:
      return 'Transport';
    case ExpenseCategory.publicity:
      return 'Publicity';
    case ExpenseCategory.electricity:
      return 'Electricity';
    case ExpenseCategory.miscellaneous:
      return 'Miscellaneous';
  }
}

String getCategoryIcon(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.decoration:
      return Assets.svgDecoration;
    case ExpenseCategory.food:
      return Assets.svgFood;
    case ExpenseCategory.pooja:
      return Assets.svgPuja;
    case ExpenseCategory.sound:
      return Assets.svgSound;
    case ExpenseCategory.lighting:
      return Assets.svgLight;
    case ExpenseCategory.tent:
      return Assets.svgTent;
    case ExpenseCategory.transport:
      return Assets.svgTransport;
    case ExpenseCategory.publicity:
      return Assets.svgPublicity;
    case ExpenseCategory.electricity:
      return Assets.svgElectricity;
    case ExpenseCategory.miscellaneous:
      return Assets.svgMiscellaneous;
  }
}

Color getCategoryIconBg(BuildContext context, ExpenseCategory category) {
  final colors = context.appColors;
  switch (category) {
    case ExpenseCategory.decoration:
      return colors.primary.withValues(alpha: 0.12);
    case ExpenseCategory.food:
      return colors.secondary.withValues(alpha: 0.12);
    case ExpenseCategory.pooja:
      return colors.warning.withValues(alpha: 0.15);
    case ExpenseCategory.sound:
      return colors.success.withValues(alpha: 0.15);
    case ExpenseCategory.lighting:
      return Colors.amber.withValues(alpha: 0.18);
    default:
      return colors.surfaceLight;
  }
}

Color getCategoryIconColor(BuildContext context, ExpenseCategory category) {
  final colors = context.appColors;
  switch (category) {
    case ExpenseCategory.decoration:
      return colors.primary;
    case ExpenseCategory.food:
      return colors.secondary;
    case ExpenseCategory.pooja:
      return colors.warning;
    case ExpenseCategory.sound:
      return colors.success;
    case ExpenseCategory.lighting:
      return Colors.amber.shade800;
    default:
      return colors.textSecondary;
  }
}

Widget displayQRCode(String data) {
  return PrettyQrView.data(
    data: data,
    decoration: const PrettyQrDecoration(
      quietZone: PrettyQrQuietZone.pixels(30),
      background: Colors.white,
      shape: PrettyQrSquaresSymbol(),
    ),
  );
}

double calculateGoalProgress({
  required double totalCollected,
  required double goalAmount,
}) {
  if (goalAmount <= 0) return 0.0;

  final progress = totalCollected / goalAmount;

  return progress.clamp(0.0, 1.0);
}

String goalProgressPercentage({
  required double totalCollected,
  required double goalAmount,
}) {
  final progress = calculateGoalProgress(
    totalCollected: totalCollected,
    goalAmount: goalAmount,
  );

  return '${(progress * 100).toStringAsFixed(0)}%';
}

class DonationUtils {
  static double getTodayCollection(List<Donation> donations) {
    final now = DateTime.now();

    return donations
        .where((donation) {
      final date = donation.createdAt;

      return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
    })
        .fold<double>(
      0.0,
          (sum, donation) => sum + donation.amount,
    );
  }
}