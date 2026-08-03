part of 'expense_bloc.dart';

@freezed
abstract class ExpenseState with _$ExpenseState {
  const factory ExpenseState({
    @Default([]) List<Expense> expenses,
    @Default(StateStatus.initial) StateStatus expensesStatus,
    String? expensesError,

    Expense? selectedExpense,
    @Default(StateStatus.initial) StateStatus expenseDetailsStatus,
    String? expenseDetailsError,

    @Default(StateStatus.initial) StateStatus expenseActionStatus,
    String? expenseActionError,
  }) = _ExpenseState;
}
