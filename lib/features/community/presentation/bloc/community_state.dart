part of 'community_bloc.dart';

@freezed
abstract class CommunityState with _$CommunityState {
  const factory CommunityState({
    Community? community,
    @Default(StateStatus.initial) StateStatus communityStatus,
    String? communityError,
  }) = _CommunityState;
}
