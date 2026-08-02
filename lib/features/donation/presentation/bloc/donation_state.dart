part of 'donation_bloc.dart';

@freezed
abstract class DonationState with _$DonationState {
  const factory DonationState({
    @Default([]) List<Donation> donations,
    @Default(StateStatus.initial) StateStatus donationsStatus,
    String? donationsError,

    Donation? selectedDonation,
    @Default(StateStatus.initial) StateStatus donationDetailsStatus,
    String? donationDetailsError,

    @Default(StateStatus.initial) StateStatus donationActionStatus,
    String? donationActionError,
  }) = _DonationState;
}
