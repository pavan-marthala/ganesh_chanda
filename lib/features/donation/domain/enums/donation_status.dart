import 'package:freezed_annotation/freezed_annotation.dart';

part 'donation_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum DonationStatus {
  @JsonValue('RECEIVED')
  received,

  @JsonValue('CANCELLED')
  cancelled;

  String toJson() => _$DonationStatusEnumMap[this]!;
  static DonationStatus fromJson(String json) {
    for (final entry in _$DonationStatusEnumMap.entries) {
      if (entry.value == json) {
        return entry.key;
      }
    }
    return DonationStatus.received;
  }
}
