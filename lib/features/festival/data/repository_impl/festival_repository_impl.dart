import 'package:injectable/injectable.dart';

import '../../domain/models/festival.dart';
import '../../domain/repository/festival_repository.dart';
import '../datasource/festival_remote_data_source.dart';

@LazySingleton(as: FestivalRepository)
class FestivalRepositoryImpl implements FestivalRepository {
  final FestivalRemoteDataSource _remoteDataSource;

  FestivalRepositoryImpl(this._remoteDataSource);

  @override
  Future<Festival> createFestival(Festival festival) async {
    try {
      return await _remoteDataSource.createFestival(festival);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Festival?> getFestivalById(String festivalId) async {
    try {
      return await _remoteDataSource.getFestivalById(festivalId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Festival>> getCommunityFestivals(String communityId) async {
    try {
      return await _remoteDataSource.getCommunityFestivals(communityId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Festival> updateFestival(Festival festival) async {
    try {
      return await _remoteDataSource.updateFestival(festival);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFestival(String festivalId) async {
    try {
      await _remoteDataSource.deleteFestival(festivalId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> assignVolunteer({
    required String festivalId,
    required String volunteerId,
  }) async {
    try {
      await _remoteDataSource.assignVolunteer(
        festivalId: festivalId,
        volunteerId: volunteerId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeVolunteer({
    required String festivalId,
    required String volunteerId,
  }) async {
    try {
      await _remoteDataSource.removeVolunteer(
        festivalId: festivalId,
        volunteerId: volunteerId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
