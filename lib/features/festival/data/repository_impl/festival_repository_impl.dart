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
  Future<Festival?> getCurrentCommunityFestival() async {
    return await _remoteDataSource.getCurrentCommunityFestival();
  }

  @override
  Future<List<Festival>> getCommunityFestivals() async {
    return await _remoteDataSource.getCommunityFestivals();
  }
}
