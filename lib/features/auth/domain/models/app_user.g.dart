// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['userId'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String? ?? '',
  role: json['role'] as String? ?? 'ADMIN',
  communityId: json['communityId'] as String?,
  accountSetupStatus:
      $enumDecodeNullable(
        _$AccountSetupStatusEnumMap,
        json['onboardingState'],
        unknownValue: AccountSetupStatus.adminRegistered,
      ) ??
      AccountSetupStatus.adminRegistered,
  phoneNumber: json['phoneNumber'] as String?,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'userId': instance.id,
  'email': instance.email,
  'displayName': instance.displayName,
  'role': instance.role,
  'communityId': instance.communityId,
  'onboardingState': instance.accountSetupStatus,
  'phoneNumber': instance.phoneNumber,
  'photoUrl': instance.photoUrl,
};

const _$AccountSetupStatusEnumMap = {
  AccountSetupStatus.adminRegistered: 'ADMIN_REGISTERED',
  AccountSetupStatus.communityCreated: 'COMMUNITY_CREATED',
  AccountSetupStatus.onboardingCompleted: 'ONBOARDING_COMPLETED',
};
