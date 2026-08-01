import 'package:freezed_annotation/freezed_annotation.dart';
import 'festival_status.dart';

part 'festival.freezed.dart';
part 'festival.g.dart';

@freezed
abstract class Festival with _$Festival {
  const factory Festival({
    required String id,
    required String communityId,
    required String name,
    @Default('') String description,
    String? bannerUrl,
    required DateTime startDate,
    required DateTime endDate,
    @Default(FestivalStatus.draft) FestivalStatus status,
    @Default(0.0) double totalDonationAmount,
    @Default(0) int totalDonationCount,
    @Default(0.0) double totalExpenseAmount,
    @Default(0) int totalExpenseCount,
    @Default(0) int totalVolunteerCount,
    @Default([]) List<String> assignedVolunteerIds,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Festival;

  factory Festival.fromJson(Map<String, dynamic> json) =>
      _$FestivalFromJson(json);
}
