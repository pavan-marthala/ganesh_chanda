import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum ExpenseStatus {
  @JsonValue('PAID')
  paid,

  @JsonValue('CANCELLED')
  cancelled;

  String toJson() => _$ExpenseStatusEnumMap[this]!;
  static ExpenseStatus fromJson(String json) {
    for (final entry in _$ExpenseStatusEnumMap.entries) {
      if (entry.value == json) {
        return entry.key;
      }
    }
    return ExpenseStatus.paid;
  }
}
