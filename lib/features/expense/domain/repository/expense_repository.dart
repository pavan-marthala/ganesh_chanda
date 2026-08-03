import '../models/expense.dart';

abstract class ExpenseRepository {
  Future<Expense> createExpense(Expense expense);
  Future<Expense> updateExpense(Expense expense);
  Future<void> deleteExpense(String expenseId);
  Future<Expense?> getExpenseById(String expenseId);
  Future<List<Expense>> getExpensesByFestival(String festivalId);
  Future<List<Expense>> getExpensesByCommunity(String communityId);
}
