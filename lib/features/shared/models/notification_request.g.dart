// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) =>
    _NotificationRequest(
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      channelId: json['channelId'] as String? ?? '',
      tokens:
          (json['tokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data: json['data'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$NotificationRequestToJson(
  _NotificationRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'body': instance.body,
  'imageUrl': instance.imageUrl,
  'channelId': instance.channelId,
  'tokens': instance.tokens,
  'data': instance.data,
};
