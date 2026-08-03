import 'package:injectable/injectable.dart';

import '../../domain/models/community.dart';
import '../../domain/repository/community_repository.dart';
import '../datasource/community_remote_data_source.dart';

@LazySingleton(as: CommunityRepository)
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDataSource _remoteDataSource;

  CommunityRepositoryImpl(this._remoteDataSource);

  @override
  Future<Community> createCommunity(Community community) async {
    try {
      return await _remoteDataSource.createCommunity(community);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Community?> getCurrentUserCommunity() async {
    try {
      return await _remoteDataSource.getCurrentUserCommunity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Community?> getCommunityByCode(String communityCode) async {
    try {
      return await _remoteDataSource.getCommunityByCode(communityCode);
    } catch (e) {
      rethrow;
    }
  }
}
