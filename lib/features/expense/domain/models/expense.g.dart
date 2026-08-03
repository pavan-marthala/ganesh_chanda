// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  festivalId: json['festivalId'] as String,
  communityId: json['communityId'] as String,
  title: json['title'] as String,
  description: json['description'] as String? ?? '',
  amount: (json['amount'] as num).toDouble(),
  category:
      $enumDecodeNullable(_$ExpenseCategoryEnumMap, json['category']) ??
      ExpenseCategory.miscellaneous,
  paymentMode:
      $enumDecodeNullable(_$PaymentModeEnumMap, json['paymentMode']) ??
      PaymentMode.cash,
  referenceNumber: json['referenceNumber'] as String?,
  paidTo: json['paidTo'] as String,
  paidBy: json['paidBy'] as String,
  receiptUrl: json['receiptUrl'] as String?,
  status:
      $enumDecodeNullable(_$ExpenseStatusEnumMap, json['status']) ??
      ExpenseStatus.paid,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'festivalId': instance.festivalId,
  'communityId': instance.communityId,
  'title': instance.title,
  'description': instance.description,
  'amount': instance.amount,
  'category': instance.category.toJson(),
  'paymentMode': instance.paymentMode.toJson(),
  'referenceNumber': instance.referenceNumber,
  'paidTo': instance.paidTo,
  'paidBy': instance.paidBy,
  'receiptUrl': instance.receiptUrl,
  'status': instance.status.toJson(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$ExpenseCategoryEnumMap = {
  ExpenseCategory.decoration: 'DECORATION',
  ExpenseCategory.food: 'FOOD',
  ExpenseCategory.pooja: 'POOJA',
  ExpenseCategory.sound: 'SOUND',
  ExpenseCategory.lighting: 'LIGHTING',
  ExpenseCategory.tent: 'TENT',
  ExpenseCategory.transport: 'TRANSPORT',
  ExpenseCategory.publicity: 'PUBLICITY',
  ExpenseCategory.electricity: 'ELECTRICITY',
  ExpenseCategory.miscellaneous: 'MISCELLANEOUS',
};

const _$PaymentModeEnumMap = {
  PaymentMode.cash: 'CASH',
  PaymentMode.upi: 'UPI',
  PaymentMode.bankTransfer: 'BANK_TRANSFER',
  PaymentMode.cheque: 'CHEQUE',
};

const _$ExpenseStatusEnumMap = {
  ExpenseStatus.paid: 'PAID',
  ExpenseStatus.cancelled: 'CANCELLED',
};
