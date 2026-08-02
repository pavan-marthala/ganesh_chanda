part of 'donation_bloc.dart';

@freezed
class DonationEvent with _$DonationEvent {
  const factory DonationEvent.loadDonationsByFestivalRequested({
    required String festivalId,
  }) = _LoadDonationsByFestivalRequested;

  const factory DonationEvent.loadDonationsByCommunityRequested({
    required String communityId,
  }) = _LoadDonationsByCommunityRequested;

  const factory DonationEvent.getDonationByIdRequested({
    required String donationId,
  }) = _GetDonationByIdRequested;

  const factory DonationEvent.createDonationRequested({
    required Donation donation,
  }) = _CreateDonationRequested;

  const factory DonationEvent.updateDonationRequested({
    required Donation donation,
  }) = _UpdateDonationRequested;

  const factory DonationEvent.deleteDonationRequested({
    required String donationId,
    required String festivalId,
  }) = _DeleteDonationRequested;
}
