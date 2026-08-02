import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_mode.g.dart';

@JsonEnum(alwaysCreate: true)
enum PaymentMode {
  @JsonValue('CASH')
  cash,

  @JsonValue('UPI')
  upi,

  @JsonValue('BANK_TRANSFER')
  bankTransfer,

  @JsonValue('CHEQUE')
  cheque;

  String toJson() => _$PaymentModeEnumMap[this]!;
  static PaymentMode fromJson(String json) {
    for (final entry in _$PaymentModeEnumMap.entries) {
      if (entry.value == json) {
        return entry.key;
      }
    }
    return PaymentMode.cash;
  }
}
