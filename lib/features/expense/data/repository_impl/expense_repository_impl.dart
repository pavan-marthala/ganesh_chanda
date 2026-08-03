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
    try {
      return await _remoteDataSource.createExpense(expense);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Expense> updateExpense(Expense expense) async {
    try {
      return await _remoteDataSource.updateExpense(expense);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    try {
      await _remoteDataSource.deleteExpense(expenseId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Expense?> getExpenseById(String expenseId) async {
    try {
      return await _remoteDataSource.getExpenseById(expenseId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpensesByFestival(String festivalId) async {
    try {
      return await _remoteDataSource.getExpensesByFestival(festivalId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpensesByCommunity(String communityId) async {
    try {
      return await _remoteDataSource.getExpensesByCommunity(communityId);
    } catch (e) {
      rethrow;
    }
  }
}
