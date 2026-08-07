import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/app_utils.dart';
import 'festival_status.dart';
import 'payment_details.dart';

part 'festival.freezed.dart';
part 'festival.g.dart';

@freezed
abstract class Festival with _$Festival {
  const Festival._();
  @JsonSerializable(explicitToJson: true)
  const factory Festival({
    required String id,
    required String communityId,
    required String name,
    @Default('') String description,
    String? bannerUrl,
    required DateTime startDate,
    required DateTime endDate,
    @Default(FestivalStatus.draft) FestivalStatus status,
    @Default(0.0) double goal,
    @Default(0.0) double totalDonationAmount,
    @Default(0) int totalDonationCount,
    @Default(0.0) double totalExpenseAmount,
    @Default(0) int totalExpenseCount,
    @Default(0) int totalVolunteerCount,
    @Default([]) List<String> assignedVolunteerIds,
    PaymentDetails? paymentDetails,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Festival;

  DateTime get _today => DateUtils.dateOnly(DateTime.now());

  DateTime get _start => DateUtils.dateOnly(startDate);

  DateTime get _end => DateUtils.dateOnly(endDate);

  bool get isUpcoming => _start.isAfter(_today);

  bool get isCompleted => _end.isBefore(_today);

  bool get isActive =>
      (_today.isAtSameMomentAs(_start) || _today.isAfter(_start)) &&
      (_today.isBefore(_end) || _today.isAtSameMomentAs(_end));

  bool get isFinalDay => _today.isAtSameMomentAs(_end);
  int get totalDays => _end.difference(_start).inDays + 1;

  int get currentDay {
    if (!isActive) return 0;

    return _today.difference(_start).inDays + 1;
  }

  CountdownInfo get upcomingCountdown {
    final duration = startDate.difference(DateTime.now());

    return CountdownInfo(
      days: duration.isNegative ? 0 : duration.inDays,
      hours: duration.isNegative ? 0 : duration.inHours % 24,
      minutes: duration.isNegative ? 0 : duration.inMinutes % 60,
    );
  }

  CountdownInfo get visarjanCountdown {
    final duration = endDate.difference(DateTime.now());

    return CountdownInfo(
      days: duration.isNegative ? 0 : duration.inDays,
      hours: duration.isNegative ? 0 : duration.inHours % 24,
      minutes: duration.isNegative ? 0 : duration.inMinutes % 60,
    );
  }

  double get goalProgress {
    if (goal <= 0) return 0;

    return (totalDonationAmount / goal).clamp(0.0, 1.0);
  }

  factory Festival.fromJson(Map<String, dynamic> json) =>
      _$FestivalFromJson(json);

  factory Festival.skeleton() => Festival(
    id: '',
    communityId: '',
    name: '',
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    createdBy: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
