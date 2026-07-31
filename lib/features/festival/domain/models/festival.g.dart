// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Festival _$FestivalFromJson(Map<String, dynamic> json) => _Festival(
  id: json['id'] as String,
  communityId: json['communityId'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  bannerUrl: json['bannerUrl'] as String?,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  status:
      $enumDecodeNullable(_$FestivalStatusEnumMap, json['status']) ??
      FestivalStatus.draft,
  createdBy: json['createdBy'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$FestivalToJson(_Festival instance) => <String, dynamic>{
  'id': instance.id,
  'communityId': instance.communityId,
  'name': instance.name,
  'description': instance.description,
  'bannerUrl': instance.bannerUrl,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'status': _$FestivalStatusEnumMap[instance.status]!,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$FestivalStatusEnumMap = {
  FestivalStatus.draft: 'DRAFT',
  FestivalStatus.upcoming: 'UPCOMING',
  FestivalStatus.active: 'ACTIVE',
  FestivalStatus.completed: 'COMPLETED',
  FestivalStatus.cancelled: 'CANCELLED',
};
