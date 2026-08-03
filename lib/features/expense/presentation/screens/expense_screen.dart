import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_utils.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_category.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_status.dart';
import 'package:ganesh_chanda/features/expense/domain/models/expense.dart';
import 'package:ganesh_chanda/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:ganesh_chanda/features/expense/presentation/widgets/add_expense_bottom_sheet.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  ExpenseCategory? _selectedCategoryFilter;

  void _loadExpenses() {
    final festival = context.read<FestivalBloc>().state.festival;
    if (festival != null && festival.id.isNotEmpty) {
      context.read<ExpenseBloc>().add(
            ExpenseEvent.loadExpensesByFestivalRequested(
              festivalId: festival.id,
            ),
          );
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Expenses',
          style: typography.headlineSmall.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: colors.textPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
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
                  Icons.chat_bubble_outline_rounded,
                  color: colors.textPrimary,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
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
                  Icons.add_rounded,
                  color: colors.textPrimary,
                  size: 20,
                ),
                onPressed: () {
                  AddExpenseBottomSheet.show(context);
                },
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: colors.border, height: 1),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (context, expenseState) {
            final isLoading =
                expenseState.expensesStatus == StateStatus.loading ||
                    expenseState.expensesStatus == StateStatus.initial;
            final isError = expenseState.expensesStatus == StateStatus.error;
            final expenses = expenseState.expenses;

            if (isError) {
              return _buildErrorStateView(
                context,
                expenseState.expensesError ?? 'Failed to load expenses',
              );
            }

            if (isLoading) {
              return Skeletonizer(
                enabled: true,
                child: _buildExpensesContent(
                  context,
                  _getMockExpenses(),
                ),
              );
            }

            if (expenses.isEmpty ||
                expenseState.expensesStatus == StateStatus.empty) {
              return _buildEmptyStateView(context);
            }

            return _buildExpensesContent(context, expenses);
          },
        ),
      ),
    );
  }

  Widget _buildErrorStateView(BuildContext context, String errorMessage) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.error.withValues(alpha: 0.12),
              ),
              child: Center(
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 40,
                  color: colors.error,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: typography.bodyMedium.copyWith(
                color: colors.text4,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                elevation: 4,
              ),
              onPressed: _loadExpenses,
              icon: const Icon(Icons.refresh_rounded, size: 20),
              label: const Text(
                'Try Again',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyStateView(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.surfaceLight,
                border: Border.all(
                  color: colors.border,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.receipt_long_outlined,
                  size: 44,
                  color: colors.primary.withValues(alpha: 0.65),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No expenses recorded',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Expenses incurred during this festival will appear here once recorded.',
              textAlign: TextAlign.center,
              style: typography.bodyMedium.copyWith(
                color: colors.text4,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                elevation: 4,
              ),
              onPressed: () {
                AddExpenseBottomSheet.show(context);
              },
              icon: const Icon(Icons.add_rounded, size: 20),
              label: const Text(
                'Add First Expense',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpensesContent(
    BuildContext context,
    List<Expense> expenses,
  ) {
    final colors = context.appColors;
    final typography = context.appTypography;

    final festival = context.watch<FestivalBloc>().state.festival;
    final totalRaised = festival?.totalDonationAmount ?? 0.0;

    final filteredExpenses = expenses.where((e) {
      if (_selectedCategoryFilter == null) return true;
      return e.category == _selectedCategoryFilter;
    }).toList();

    final totalExpenseAmount = expenses.fold<double>(
      0.0,
      (sum, e) => sum + (e.status == ExpenseStatus.paid ? e.amount : 0.0),
    );
    final availableBalance = (totalRaised - totalExpenseAmount).clamp(
      0.0,
      double.infinity,
    );

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Balance Card (Maroon Gradient from HTML prototype)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: context.appGradients.secondary,
              boxShadow: [
                BoxShadow(
                  color: colors.secondary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Expenses',
                      style: typography.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.75),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatAmount(totalExpenseAmount),
                      style: typography.headlineMedium.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Available Balance',
                      style: typography.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.75),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatAmount(availableBalance),
                      style: typography.titleLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Dynamic Category Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                // "All Categories" Chip
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryFilter = null;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _selectedCategoryFilter == null
                          ? colors.primary
                          : colors.surfaceLight,
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(
                        color: _selectedCategoryFilter == null
                            ? colors.primary
                            : colors.border,
                      ),
                    ),
                    child: Text(
                      'All Categories',
                      style: typography.labelLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: _selectedCategoryFilter == null
                            ? Colors.white
                            : colors.textSecondary,
                      ),
                    ),
                  ),
                ),

                // Enum Generated Chips
                ...ExpenseCategory.values.map((cat) {
                  final isSelected = _selectedCategoryFilter == cat;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryFilter = cat;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colors.primary
                            : colors.surfaceLight,
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(
                          color: isSelected ? colors.primary : colors.border,
                        ),
                      ),
                      child: Text(
                        getCategoryDisplayName(cat),
                        style: typography.labelLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: isSelected
                              ? Colors.white
                              : colors.textSecondary,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Section Header
          Text(
            'Recent Expenses',
            style: typography.titleLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.textPrimary,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 12),

          // Expense List Rows
          if (filteredExpenses.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Center(
                child: Text(
                  'No expenses found in this category.',
                  style: typography.bodyMedium.copyWith(
                    color: colors.text4,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          else
            Column(
              children: filteredExpenses.map((expense) {
                return _buildExpenseCard(context, expense);
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildExpenseCard(BuildContext context, Expense expense) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final isCancelled = expense.status == ExpenseStatus.cancelled;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: context.isDark ? 0.2 : 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: getCategoryIconBg(context, expense.category),
            ),
            child: Center(
              child: Icon(
                getCategoryIcon(expense.category),
                size: 22,
                color: getCategoryIconColor(context, expense.category),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Title & Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: typography.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${getCategoryDisplayName(expense.category)} · ${_formatDate(expense.createdAt)}',
                  style: typography.caption.copyWith(
                    color: colors.text4,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Amount & Bill Icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatAmount(expense.amount),
                style: typography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isCancelled ? colors.warning : colors.textPrimary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.surfaceLight,
                  border: Border.all(color: colors.border),
                ),
                child: Center(
                  child: Icon(
                    Icons.description_outlined,
                    size: 16,
                    color: colors.text4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Expense> _getMockExpenses() {
    final now = DateTime.now();
    return [
      Expense(
        id: 'e1',
        festivalId: 'f1',
        communityId: 'c1',
        title: 'Flower & Mandap Decoration',
        amount: 8500,
        category: ExpenseCategory.decoration,
        paidTo: 'Venkatesh Decorators',
        paidBy: 'u1',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now,
      ),
      Expense(
        id: 'e2',
        festivalId: 'f1',
        communityId: 'c1',
        title: 'Puja Samagri & Flowers',
        amount: 4250,
        category: ExpenseCategory.pooja,
        paidTo: 'Panditji Store',
        paidBy: 'u1',
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now,
      ),
      Expense(
        id: 'e3',
        festivalId: 'f1',
        communityId: 'c1',
        title: 'Sound System Rental',
        amount: 12000,
        category: ExpenseCategory.sound,
        paidTo: 'DJ Beats',
        paidBy: 'u1',
        createdAt: now.subtract(const Duration(days: 3)),
        updatedAt: now,
      ),
    ];
  }
}
