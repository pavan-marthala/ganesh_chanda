import 'package:freezed_annotation/freezed_annotation.dart';

enum EventStatus {
  @JsonValue('upcoming')
  upcoming,
  @JsonValue('live')
  live,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}
