import '../models/festival.dart';

abstract class FestivalRepository {
  Future<Festival> createFestival(Festival festival);
  Future<Festival?> getCurrentCommunityFestival(String communityId);
  Future<List<Festival>> getCommunityFestivals(String communityId);
}
