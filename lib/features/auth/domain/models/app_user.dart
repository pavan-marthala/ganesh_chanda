import 'package:freezed_annotation/freezed_annotation.dart';
import 'account_setup_status.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @JsonKey(name: 'userId') required String id,
    required String email,
    @JsonKey(defaultValue: '') required String displayName,
    @JsonKey(defaultValue: 'ADMIN') required String role,
    String? communityId,
    @JsonKey(
      name: 'onboardingState',
      unknownEnumValue: AccountSetupStatus.adminRegistered,
      defaultValue: AccountSetupStatus.adminRegistered,
    )
    required AccountSetupStatus accountSetupStatus,
    String? phoneNumber,
    String? photoUrl,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
