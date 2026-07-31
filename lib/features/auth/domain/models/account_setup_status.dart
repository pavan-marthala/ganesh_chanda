import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_setup_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum AccountSetupStatus {
  @JsonValue('ADMIN_REGISTERED')
  adminRegistered,

  @JsonValue('COMMUNITY_CREATED')
  communityCreated,

  @JsonValue('ONBOARDING_COMPLETED')
  onboardingCompleted;

  String toJson() => _$AccountSetupStatusEnumMap[this]!;
  static AccountSetupStatus fromJson(String json) {
    for (final entry in _$AccountSetupStatusEnumMap.entries) {
      if (entry.value == json) {
        return entry.key;
      }
    }
    return AccountSetupStatus.adminRegistered;
  }
}
