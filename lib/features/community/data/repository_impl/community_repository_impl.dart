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
    return await _remoteDataSource.createCommunity(community);
  }

  @override
  Future<Community?> getCurrentUserCommunity() async {
    return await _remoteDataSource.getCurrentUserCommunity();
  }
}
