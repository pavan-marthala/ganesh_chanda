import 'package:flutter/material.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
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
