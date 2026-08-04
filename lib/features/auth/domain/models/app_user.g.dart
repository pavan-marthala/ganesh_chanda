// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['userId'] as String? ?? "",
  email: json['email'] as String? ?? '',
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
  notificationDevices:
      (json['notificationDevices'] as List<dynamic>?)
          ?.map((e) => NotificationDevice.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
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
  'notificationDevices': instance.notificationDevices,
  'phoneNumber': instance.phoneNumber,
  'photoUrl': instance.photoUrl,
};

const _$AccountSetupStatusEnumMap = {
  AccountSetupStatus.adminRegistered: 'ADMIN_REGISTERED',
  AccountSetupStatus.communityCreated: 'COMMUNITY_CREATED',
  AccountSetupStatus.onboardingCompleted: 'ONBOARDING_COMPLETED',
};

_NotificationDevice _$NotificationDeviceFromJson(Map<String, dynamic> json) =>
    _NotificationDevice(
      deviceId: json['deviceId'] as String? ?? '',
      token: json['token'] as String? ?? '',
      platform:
          $enumDecodeNullable(_$DevicePlatformEnumMap, json['platform']) ??
          DevicePlatform.android,
      deviceName: json['deviceName'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationDeviceToJson(_NotificationDevice instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'token': instance.token,
      'platform': _$DevicePlatformEnumMap[instance.platform]!,
      'deviceName': instance.deviceName,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$DevicePlatformEnumMap = {
  DevicePlatform.android: 'android',
  DevicePlatform.ios: 'ios',
  DevicePlatform.web: 'web',
  DevicePlatform.macos: 'macos',
  DevicePlatform.windows: 'windows',
  DevicePlatform.linux: 'linux',
  DevicePlatform.other: 'other',
};
