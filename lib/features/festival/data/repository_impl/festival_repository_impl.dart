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
    return await _remoteDataSource.createFestival(festival);
  }

  @override
  Future<Festival?> getFestivalById(String festivalId) async {
    return await _remoteDataSource.getFestivalById(festivalId);
  }

  @override
  Future<List<Festival>> getCommunityFestivals(String communityId) async {
    return await _remoteDataSource.getCommunityFestivals(communityId);
  }

  @override
  Future<Festival> updateFestival(Festival festival) async {
    return await _remoteDataSource.updateFestival(festival);
  }

  @override
  Future<void> deleteFestival(String festivalId) async {
    await _remoteDataSource.deleteFestival(festivalId);
  }

  @override
  Future<void> assignVolunteer({
    required String festivalId,
    required String volunteerId,
  }) async {
    await _remoteDataSource.assignVolunteer(
      festivalId: festivalId,
      volunteerId: volunteerId,
    );
  }

  @override
  Future<void> removeVolunteer({
    required String festivalId,
    required String volunteerId,
  }) async {
    await _remoteDataSource.removeVolunteer(
      festivalId: festivalId,
      volunteerId: volunteerId,
    );
  }
}
