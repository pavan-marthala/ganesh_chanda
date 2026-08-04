import 'package:freezed_annotation/freezed_annotation.dart';
import 'account_setup_status.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @JsonKey(name: 'userId') @Default("") String id,
    @Default('') String email,
    @Default('') String displayName,
    @JsonKey(defaultValue: 'ADMIN') @Default('ADMIN') String role,
    String? communityId,
    @JsonKey(
      name: 'onboardingState',
      unknownEnumValue: AccountSetupStatus.adminRegistered,
      defaultValue: AccountSetupStatus.adminRegistered,
    )
    @Default(AccountSetupStatus.adminRegistered)
    AccountSetupStatus accountSetupStatus,
    @Default([]) List<NotificationDevice> notificationDevices,
    String? phoneNumber,
    String? photoUrl,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

@freezed
abstract class NotificationDevice with _$NotificationDevice {
  const factory NotificationDevice({
    /// Unique device identifier
    @Default('') String deviceId,

    /// Firebase Cloud Messaging token
    @Default('') String token,

    /// Device platform
    @Default(DevicePlatform.android) DevicePlatform platform,

    /// Device display name (e.g. "Pavan's iPhone")
    @Default('') String deviceName,

    /// Whether this device should receive notifications
    @Default(true) bool isActive,

    /// Audit
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotificationDevice;

  factory NotificationDevice.fromJson(Map<String, dynamic> json) =>
      _$NotificationDeviceFromJson(json);
}

enum DevicePlatform { android, ios, web, macos, windows, linux,other }
