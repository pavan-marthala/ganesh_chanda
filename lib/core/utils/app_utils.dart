import 'package:flutter/material.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_category.dart';
import 'package:intl/intl.dart';

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

IconData getCategoryIcon(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.decoration:
      return Icons.filter_vintage_rounded;
    case ExpenseCategory.food:
      return Icons.restaurant_rounded;
    case ExpenseCategory.pooja:
      return Icons.auto_awesome_rounded;
    case ExpenseCategory.sound:
      return Icons.volume_up_rounded;
    case ExpenseCategory.lighting:
      return Icons.lightbulb_rounded;
    case ExpenseCategory.tent:
      return Icons.storefront_rounded;
    case ExpenseCategory.transport:
      return Icons.local_shipping_rounded;
    case ExpenseCategory.publicity:
      return Icons.campaign_rounded;
    case ExpenseCategory.electricity:
      return Icons.bolt_rounded;
    case ExpenseCategory.miscellaneous:
      return Icons.category_rounded;
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
