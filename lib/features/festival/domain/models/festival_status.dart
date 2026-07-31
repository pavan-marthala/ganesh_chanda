import 'package:freezed_annotation/freezed_annotation.dart';

enum FestivalStatus {
  @JsonValue('DRAFT')
  draft,
  @JsonValue('UPCOMING')
  upcoming,
  @JsonValue('ACTIVE')
  active,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
}
