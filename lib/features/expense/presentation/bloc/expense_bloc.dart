import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/expense.dart';
import '../../domain/repository/expense_repository.dart';

part 'expense_event.dart';
part 'expense_state.dart';
part 'expense_bloc.freezed.dart';

@injectable
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository _expenseRepository;

  ExpenseBloc(this._expenseRepository) : super(const ExpenseState()) {
    on<ExpenseEvent>((event, emit) async {
      await event.map(
        loadExpensesByFestivalRequested: (e) async {
          emit(
            state.copyWith(
              expensesStatus: StateStatus.loading,
              expensesError: null,
            ),
          );
          try {
            final expenses = await _expenseRepository.getExpensesByFestival(
              e.festivalId,
            );
            emit(
              state.copyWith(
                expenses: expenses,
                expensesStatus:
                    expenses.isEmpty ? StateStatus.empty : StateStatus.loaded,
                expensesError: null,
              ),
            );
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                expensesStatus: StateStatus.error,
                expensesError: errorMessage,
              ),
            );
          }
        },
        loadExpensesByCommunityRequested: (e) async {
          emit(
            state.copyWith(
              expensesStatus: StateStatus.loading,
              expensesError: null,
            ),
          );
          try {
            final expenses = await _expenseRepository.getExpensesByCommunity(
              e.communityId,
            );
            emit(
              state.copyWith(
                expenses: expenses,
                expensesStatus:
                    expenses.isEmpty ? StateStatus.empty : StateStatus.loaded,
                expensesError: null,
              ),
            );
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                expensesStatus: StateStatus.error,
                expensesError: errorMessage,
              ),
            );
          }
        },
        getExpenseByIdRequested: (e) async {
          emit(
            state.copyWith(
              expenseDetailsStatus: StateStatus.loading,
              expenseDetailsError: null,
            ),
          );
          try {
            final expense = await _expenseRepository.getExpenseById(
              e.expenseId,
            );
            if (expense != null) {
              emit(
                state.copyWith(
                  selectedExpense: expense,
                  expenseDetailsStatus: StateStatus.loaded,
                  expenseDetailsError: null,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  selectedExpense: null,
                  expenseDetailsStatus: StateStatus.empty,
                  expenseDetailsError: 'Expense not found.',
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                expenseDetailsStatus: StateStatus.error,
                expenseDetailsError: errorMessage,
              ),
            );
          }
        },
        createExpenseRequested: (e) async {
          emit(
            state.copyWith(
              expenseActionStatus: StateStatus.loading,
              expenseActionError: null,
            ),
          );
          try {
            final createdExpense = await _expenseRepository.createExpense(
              e.expense,
            );
            final updatedList = [createdExpense, ...state.expenses];
            emit(
              state.copyWith(
                expenses: updatedList,
                selectedExpense: createdExpense,
                expensesStatus: StateStatus.loaded,
                expenseActionStatus: StateStatus.loaded,
                expenseActionError: null,
              ),
            );
            if (e.expense.festivalId.isNotEmpty) {
              add(
                ExpenseEvent.loadExpensesByFestivalRequested(
                  festivalId: e.expense.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                expenseActionStatus: StateStatus.error,
                expenseActionError: errorMessage,
              ),
            );
          }
        },
        updateExpenseRequested: (e) async {
          emit(
            state.copyWith(
              expenseActionStatus: StateStatus.loading,
              expenseActionError: null,
            ),
          );
          try {
            final updatedExpense = await _expenseRepository.updateExpense(
              e.expense,
            );
            final updatedList = state.expenses.map((ex) {
              return ex.id == updatedExpense.id ? updatedExpense : ex;
            }).toList();
            emit(
              state.copyWith(
                expenses: updatedList,
                selectedExpense: updatedExpense,
                expenseActionStatus: StateStatus.loaded,
                expenseActionError: null,
              ),
            );
            if (e.expense.festivalId.isNotEmpty) {
              add(
                ExpenseEvent.loadExpensesByFestivalRequested(
                  festivalId: e.expense.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                expenseActionStatus: StateStatus.error,
                expenseActionError: errorMessage,
              ),
            );
          }
        },
        deleteExpenseRequested: (e) async {
          emit(
            state.copyWith(
              expenseActionStatus: StateStatus.loading,
              expenseActionError: null,
            ),
          );
          try {
            await _expenseRepository.deleteExpense(e.expenseId);
            final updatedList =
                state.expenses.where((ex) => ex.id != e.expenseId).toList();
            emit(
              state.copyWith(
                expenses: updatedList,
                expenseActionStatus: StateStatus.loaded,
                expenseActionError: null,
              ),
            );
            if (e.festivalId.isNotEmpty) {
              add(
                ExpenseEvent.loadExpensesByFestivalRequested(
                  festivalId: e.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage =
                error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                expenseActionStatus: StateStatus.error,
                expenseActionError: errorMessage,
              ),
            );
          }
        },
      );
    });
  }
}
