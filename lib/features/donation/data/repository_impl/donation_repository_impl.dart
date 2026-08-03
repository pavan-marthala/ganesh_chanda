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
    try {
      return await _remoteDataSource.createDonation(donation);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Donation> updateDonation(Donation donation) async {
    try {
      return await _remoteDataSource.updateDonation(donation);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteDonation(String donationId) async {
    try {
      await _remoteDataSource.deleteDonation(donationId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Donation?> getDonationById(String donationId) async {
    try {
      return await _remoteDataSource.getDonationById(donationId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Donation>> getDonationsByFestival(String festivalId) async {
    try {
      return await _remoteDataSource.getDonationsByFestival(festivalId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Donation>> getDonationsByCommunity(String communityId) async {
    try {
      return await _remoteDataSource.getDonationsByCommunity(communityId);
    } catch (e) {
      rethrow;
    }
  }
}
