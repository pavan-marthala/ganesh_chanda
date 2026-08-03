import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_category.g.dart';

@JsonEnum(alwaysCreate: true)
enum ExpenseCategory {
  @JsonValue('DECORATION')
  decoration,

  @JsonValue('FOOD')
  food,

  @JsonValue('POOJA')
  pooja,

  @JsonValue('SOUND')
  sound,

  @JsonValue('LIGHTING')
  lighting,

  @JsonValue('TENT')
  tent,

  @JsonValue('TRANSPORT')
  transport,

  @JsonValue('PUBLICITY')
  publicity,

  @JsonValue('ELECTRICITY')
  electricity,

  @JsonValue('MISCELLANEOUS')
  miscellaneous;

  String toJson() => _$ExpenseCategoryEnumMap[this]!;
  static ExpenseCategory fromJson(String json) {
    for (final entry in _$ExpenseCategoryEnumMap.entries) {
      if (entry.value == json) {
        return entry.key;
      }
    }
    return ExpenseCategory.miscellaneous;
  }
}
