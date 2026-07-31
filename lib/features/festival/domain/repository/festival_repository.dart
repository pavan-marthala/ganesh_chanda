import '../models/festival.dart';

abstract class FestivalRepository {
  Future<Festival> createFestival(Festival festival);
  Future<Festival?> getCurrentCommunityFestival();
  Future<List<Festival>> getCommunityFestivals();
}
