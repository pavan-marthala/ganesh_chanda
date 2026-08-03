import 'package:injectable/injectable.dart';

import '../../domain/models/expense.dart';
import '../../domain/repository/expense_repository.dart';
import '../datasource/expense_remote_data_source.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remoteDataSource;

  ExpenseRepositoryImpl(this._remoteDataSource);

  @override
  Future<Expense> createExpense(Expense expense) async {
    return await _remoteDataSource.createExpense(expense);
  }

  @override
  Future<Expense> updateExpense(Expense expense) async {
    return await _remoteDataSource.updateExpense(expense);
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    await _remoteDataSource.deleteExpense(expenseId);
  }

  @override
  Future<Expense?> getExpenseById(String expenseId) async {
    return await _remoteDataSource.getExpenseById(expenseId);
  }

  @override
  Future<List<Expense>> getExpensesByFestival(String festivalId) async {
    return await _remoteDataSource.getExpensesByFestival(festivalId);
  }

  @override
  Future<List<Expense>> getExpensesByCommunity(String communityId) async {
    return await _remoteDataSource.getExpensesByCommunity(communityId);
  }
}
