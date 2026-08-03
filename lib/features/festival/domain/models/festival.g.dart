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
  goal: (json['goal'] as num?)?.toDouble() ?? 0.0,
  totalDonationAmount: (json['totalDonationAmount'] as num?)?.toDouble() ?? 0.0,
  totalDonationCount: (json['totalDonationCount'] as num?)?.toInt() ?? 0,
  totalExpenseAmount: (json['totalExpenseAmount'] as num?)?.toDouble() ?? 0.0,
  totalExpenseCount: (json['totalExpenseCount'] as num?)?.toInt() ?? 0,
  totalVolunteerCount: (json['totalVolunteerCount'] as num?)?.toInt() ?? 0,
  assignedVolunteerIds:
      (json['assignedVolunteerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  paymentDetails: json['paymentDetails'] == null
      ? null
      : PaymentDetails.fromJson(json['paymentDetails'] as Map<String, dynamic>),
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
  'goal': instance.goal,
  'totalDonationAmount': instance.totalDonationAmount,
  'totalDonationCount': instance.totalDonationCount,
  'totalExpenseAmount': instance.totalExpenseAmount,
  'totalExpenseCount': instance.totalExpenseCount,
  'totalVolunteerCount': instance.totalVolunteerCount,
  'assignedVolunteerIds': instance.assignedVolunteerIds,
  'paymentDetails': instance.paymentDetails?.toJson(),
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
