// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Donation _$DonationFromJson(Map<String, dynamic> json) => _Donation(
  id: json['id'] as String,
  festivalId: json['festivalId'] as String,
  communityId: json['communityId'] as String,
  donorName: json['donorName'] as String,
  donorPhone: json['donorPhone'] as String? ?? '',
  amount: (json['amount'] as num).toDouble(),
  paymentMode:
      $enumDecodeNullable(_$PaymentModeEnumMap, json['paymentMode']) ??
      PaymentMode.cash,
  referenceNumber: json['referenceNumber'] as String?,
  notes: json['notes'] as String? ?? '',
  collectedBy: json['collectedBy'] as String,
  receiptNumber: json['receiptNumber'] as String? ?? '',
  status:
      $enumDecodeNullable(_$DonationStatusEnumMap, json['status']) ??
      DonationStatus.received,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DonationToJson(_Donation instance) => <String, dynamic>{
  'id': instance.id,
  'festivalId': instance.festivalId,
  'communityId': instance.communityId,
  'donorName': instance.donorName,
  'donorPhone': instance.donorPhone,
  'amount': instance.amount,
  'paymentMode': instance.paymentMode,
  'referenceNumber': instance.referenceNumber,
  'notes': instance.notes,
  'collectedBy': instance.collectedBy,
  'receiptNumber': instance.receiptNumber,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$PaymentModeEnumMap = {
  PaymentMode.cash: 'CASH',
  PaymentMode.upi: 'UPI',
  PaymentMode.bankTransfer: 'BANK_TRANSFER',
  PaymentMode.cheque: 'CHEQUE',
};

const _$DonationStatusEnumMap = {
  DonationStatus.received: 'RECEIVED',
  DonationStatus.cancelled: 'CANCELLED',
};
