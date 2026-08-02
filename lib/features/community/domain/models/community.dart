import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';
import 'contact.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
abstract class Community with _$Community {
  @JsonSerializable(explicitToJson: true)
  const factory Community({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String communityCode,
    String? logoUrl,
    Address? address,
    Contact? contact,
    @Default('') String createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
