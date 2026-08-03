import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/enums/expense_status.dart';
import '../../domain/models/expense.dart';

abstract class ExpenseRemoteDataSource {
  Future<Expense> createExpense(Expense expense);
  Future<Expense> updateExpense(Expense expense);
  Future<void> deleteExpense(String expenseId);
  Future<Expense?> getExpenseById(String expenseId);
  Future<List<Expense>> getExpensesByFestival(String festivalId);
  Future<List<Expense>> getExpensesByCommunity(String communityId);
}

@LazySingleton(as: ExpenseRemoteDataSource)
class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  ExpenseRemoteDataSourceImpl(this._firestore, this._firebaseAuth);

  @override
  Future<Expense> createExpense(Expense expense) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final docRef = _firestore.collection('expenses').doc();
      final now = DateTime.now();

      final fullExpense = expense.copyWith(
        id: docRef.id,
        paidBy: expense.paidBy.isEmpty
            ? (currentUser?.uid ?? '')
            : expense.paidBy,
        createdAt: now,
        updatedAt: now,
      );

      final jsonMap = fullExpense.toJson();
      jsonMap['createdAt'] = Timestamp.fromDate(now);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.set(jsonMap);

      // Sync festival summary if expense is paid
      if (fullExpense.status == ExpenseStatus.paid) {
        await _updateFestivalSummary(
          festivalId: fullExpense.festivalId,
          amountDelta: fullExpense.amount,
          countDelta: 1,
        );
      }

      return fullExpense;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Expense> updateExpense(Expense expense) async {
    try {
      final docRef = _firestore.collection('expenses').doc(expense.id);
      final existingDoc = await docRef.get();

      if (!existingDoc.exists || existingDoc.data() == null) {
        throw Exception('Expense not found');
      }

      final oldData = existingDoc.data()!;
      _convertTimestamps(oldData);
      final oldExpense = Expense.fromJson(oldData);

      final now = DateTime.now();
      final updatedExpense = expense.copyWith(
        updatedAt: now,
      );

      final jsonMap = updatedExpense.toJson();
      jsonMap['createdAt'] = Timestamp.fromDate(expense.createdAt);
      jsonMap['updatedAt'] = Timestamp.fromDate(now);

      await docRef.update(jsonMap);

      // Compute delta for festival summary updates
      double oldEffectiveAmount =
          oldExpense.status == ExpenseStatus.paid ? oldExpense.amount : 0.0;
      int oldEffectiveCount = oldExpense.status == ExpenseStatus.paid ? 1 : 0;

      double newEffectiveAmount = updatedExpense.status == ExpenseStatus.paid
          ? updatedExpense.amount
          : 0.0;
      int newEffectiveCount =
          updatedExpense.status == ExpenseStatus.paid ? 1 : 0;

      double amountDelta = newEffectiveAmount - oldEffectiveAmount;
      int countDelta = newEffectiveCount - oldEffectiveCount;

      if (amountDelta != 0 || countDelta != 0) {
        await _updateFestivalSummary(
          festivalId: updatedExpense.festivalId,
          amountDelta: amountDelta,
          countDelta: countDelta,
        );
      }

      return updatedExpense;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    try {
      final docRef = _firestore.collection('expenses').doc(expenseId);
      final doc = await docRef.get();

      if (!doc.exists || doc.data() == null) return;

      final data = doc.data()!;
      _convertTimestamps(data);
      final expense = Expense.fromJson(data);

      await docRef.delete();

      if (expense.status == ExpenseStatus.paid) {
        await _updateFestivalSummary(
          festivalId: expense.festivalId,
          amountDelta: -expense.amount,
          countDelta: -1,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Expense?> getExpenseById(String expenseId) async {
    try {
      final doc = await _firestore.collection('expenses').doc(expenseId).get();
      if (!doc.exists || doc.data() == null) return null;

      final data = doc.data()!;
      _convertTimestamps(data);
      return Expense.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpensesByFestival(String festivalId) async {
    try {
      final querySnapshot = await _firestore
          .collection('expenses')
          .where('festivalId', isEqualTo: festivalId)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Expense.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpensesByCommunity(String communityId) async {
    try {
      final querySnapshot = await _firestore
          .collection('expenses')
          .where('communityId', isEqualTo: communityId)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        _convertTimestamps(data);
        return Expense.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _updateFestivalSummary({
    required String festivalId,
    required double amountDelta,
    required int countDelta,
  }) async {
    if (festivalId.isEmpty) return;
    final festivalRef = _firestore.collection('festivals').doc(festivalId);
    await festivalRef.update({
      'totalExpenseAmount': FieldValue.increment(amountDelta),
      'totalExpenseCount': FieldValue.increment(countDelta),
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    });
  }

  void _convertTimestamps(Map<String, dynamic> data) {
    if (data['createdAt'] is Timestamp) {
      data['createdAt'] =
          (data['createdAt'] as Timestamp).toDate().toIso8601String();
    }
    if (data['updatedAt'] is Timestamp) {
      data['updatedAt'] =
          (data['updatedAt'] as Timestamp).toDate().toIso8601String();
    }
  }
}
