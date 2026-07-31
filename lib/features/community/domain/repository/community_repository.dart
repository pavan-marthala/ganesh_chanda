import '../models/community.dart';

abstract class CommunityRepository {
  Future<Community> createCommunity(Community community);
  Future<Community?> getCurrentUserCommunity();
}
