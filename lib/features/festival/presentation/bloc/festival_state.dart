part of 'festival_bloc.dart';

@freezed
abstract class FestivalState with _$FestivalState {
  const factory FestivalState({
    @Default([]) List<Festival> festivals,
    @Default(StateStatus.initial) StateStatus festivalsStatus,
    String? festivalsError,
    Festival? festival,
    @Default(StateStatus.initial) StateStatus festivalStatus,
    String? festivalError,
    @Default(StateStatus.initial) StateStatus festivalActionStatus,
    String? festivalActionError,
  }) = _FestivalState;
}
