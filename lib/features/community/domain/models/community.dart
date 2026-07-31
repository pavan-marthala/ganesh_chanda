import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';
import 'contact.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
abstract class Community with _$Community {
  const factory Community({
    required String id,
    required String name,
    @Default('') String description,
    String? logoUrl,
    required Address address,
    required Contact contact,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
