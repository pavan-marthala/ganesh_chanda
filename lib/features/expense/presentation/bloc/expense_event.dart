part of 'expense_bloc.dart';

@freezed
class ExpenseEvent with _$ExpenseEvent {
  const factory ExpenseEvent.loadExpensesByFestivalRequested({
    required String festivalId,
  }) = _LoadExpensesByFestivalRequested;

  const factory ExpenseEvent.loadExpensesByCommunityRequested({
    required String communityId,
  }) = _LoadExpensesByCommunityRequested;

  const factory ExpenseEvent.getExpenseByIdRequested({
    required String expenseId,
  }) = _GetExpenseByIdRequested;

  const factory ExpenseEvent.createExpenseRequested({
    required Expense expense,
  }) = _CreateExpenseRequested;

  const factory ExpenseEvent.updateExpenseRequested({
    required Expense expense,
  }) = _UpdateExpenseRequested;

  const factory ExpenseEvent.deleteExpenseRequested({
    required String expenseId,
    required String festivalId,
  }) = _DeleteExpenseRequested;
}
