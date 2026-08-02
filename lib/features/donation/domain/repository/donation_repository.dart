import '../models/donation.dart';

abstract class DonationRepository {
  Future<Donation> createDonation(Donation donation);
  Future<Donation> updateDonation(Donation donation);
  Future<void> deleteDonation(String donationId);
  Future<Donation?> getDonationById(String donationId);
  Future<List<Donation>> getDonationsByFestival(String festivalId);
  Future<List<Donation>> getDonationsByCommunity(String communityId);
}
