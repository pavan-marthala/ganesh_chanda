import 'package:injectable/injectable.dart';

import '../../domain/models/donation.dart';
import '../../domain/repository/donation_repository.dart';
import '../datasource/donation_remote_data_source.dart';

@LazySingleton(as: DonationRepository)
class DonationRepositoryImpl implements DonationRepository {
  final DonationRemoteDataSource _remoteDataSource;

  DonationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Donation> createDonation(Donation donation) async {
    return await _remoteDataSource.createDonation(donation);
  }

  @override
  Future<Donation> updateDonation(Donation donation) async {
    return await _remoteDataSource.updateDonation(donation);
  }

  @override
  Future<void> deleteDonation(String donationId) async {
    await _remoteDataSource.deleteDonation(donationId);
  }

  @override
  Future<Donation?> getDonationById(String donationId) async {
    return await _remoteDataSource.getDonationById(donationId);
  }

  @override
  Future<List<Donation>> getDonationsByFestival(String festivalId) async {
    return await _remoteDataSource.getDonationsByFestival(festivalId);
  }

  @override
  Future<List<Donation>> getDonationsByCommunity(String communityId) async {
    return await _remoteDataSource.getDonationsByCommunity(communityId);
  }
}
