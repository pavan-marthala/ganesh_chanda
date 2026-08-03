// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  id: json['id'] as String,
  festivalId: json['festivalId'] as String,
  communityId: json['communityId'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  bannerUrl: json['bannerUrl'] as String?,
  date: DateTime.parse(json['date'] as String),
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  location: json['location'] as String,
  assignedVolunteerIds:
      (json['assignedVolunteerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  status:
      $enumDecodeNullable(_$EventStatusEnumMap, json['status']) ??
      EventStatus.upcoming,
  createdBy: json['createdBy'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'id': instance.id,
  'festivalId': instance.festivalId,
  'communityId': instance.communityId,
  'name': instance.name,
  'description': instance.description,
  'bannerUrl': instance.bannerUrl,
  'date': instance.date.toIso8601String(),
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'location': instance.location,
  'assignedVolunteerIds': instance.assignedVolunteerIds,
  'status': _$EventStatusEnumMap[instance.status]!,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$EventStatusEnumMap = {
  EventStatus.upcoming: 'upcoming',
  EventStatus.live: 'live',
  EventStatus.completed: 'completed',
  EventStatus.cancelled: 'cancelled',
};
