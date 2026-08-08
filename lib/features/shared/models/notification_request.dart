import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_request.freezed.dart';
part 'notification_request.g.dart';

@freezed
abstract class NotificationRequest with _$NotificationRequest {
  const factory NotificationRequest({
    @Default('') String title,
    @Default('') String body,
    String? imageUrl,
    @Default('') String channelId,
    @Default([]) List<String> tokens,
    @Default({}) Map<String, dynamic> data,
  }) = _NotificationRequest;

  factory NotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationRequestFromJson(json);
}
