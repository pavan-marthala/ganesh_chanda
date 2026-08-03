import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/payment_mode.dart';
import '../enums/expense_category.dart';
import '../enums/expense_status.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
abstract class Expense with _$Expense {
  @JsonSerializable(explicitToJson: true)
  const factory Expense({
    required String id,
    required String festivalId,
    required String communityId,
    required String title,
    @Default('') String description,
    required double amount,
    @Default(ExpenseCategory.miscellaneous) ExpenseCategory category,
    @Default(PaymentMode.cash) PaymentMode paymentMode,
    String? referenceNumber,
    required String paidTo,
    required String paidBy,
    String? receiptUrl,
    @Default(ExpenseStatus.paid) ExpenseStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
