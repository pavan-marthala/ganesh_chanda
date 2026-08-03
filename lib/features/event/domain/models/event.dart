import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/event_status.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event with _$Event {
  @JsonSerializable(explicitToJson: true)
  const factory Event({
    required String id,
    required String festivalId,
    required String communityId,
    required String name,
    required String description,
    String? bannerUrl,
    required DateTime date,
    required String startTime,
    required String endTime,
    required String location,
    @Default([]) List<String> assignedVolunteerIds,
    @Default(EventStatus.upcoming) EventStatus status,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
