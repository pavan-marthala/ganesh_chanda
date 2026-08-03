// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) =>
    _PaymentDetails(
      upiId: json['upiId'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      accountHolderName: json['accountHolderName'] as String? ?? '',
      accountNumber: json['accountNumber'] as String? ?? '',
      ifscCode: json['ifscCode'] as String? ?? '',
      chequePayeeName: json['chequePayeeName'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentDetailsToJson(_PaymentDetails instance) =>
    <String, dynamic>{
      'upiId': instance.upiId,
      'bankName': instance.bankName,
      'accountHolderName': instance.accountHolderName,
      'accountNumber': instance.accountNumber,
      'ifscCode': instance.ifscCode,
      'chequePayeeName': instance.chequePayeeName,
    };
