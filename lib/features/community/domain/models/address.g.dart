// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  street: json['street'] as String? ?? '',
  locality: json['locality'] as String? ?? '',
  city: json['city'] as String? ?? '',
  district: json['district'] as String? ?? '',
  state: json['state'] as String? ?? '',
  country: json['country'] as String? ?? '',
  pinCode: json['pinCode'] as String? ?? '',
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'street': instance.street,
  'locality': instance.locality,
  'city': instance.city,
  'district': instance.district,
  'state': instance.state,
  'country': instance.country,
  'pinCode': instance.pinCode,
};
