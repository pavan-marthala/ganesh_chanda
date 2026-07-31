// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  phone: json['phone'] as String? ?? '',
  email: json['email'] as String? ?? '',
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'phone': instance.phone,
  'email': instance.email,
};
