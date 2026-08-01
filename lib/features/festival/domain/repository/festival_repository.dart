import '../models/festival.dart';

abstract class FestivalRepository {
  Future<Festival> createFestival(Festival festival);
  Future<Festival?> getFestivalById(String festivalId);
  Future<List<Festival>> getCommunityFestivals(String communityId);
  Future<Festival> updateFestival(Festival festival);
  Future<void> deleteFestival(String festivalId);
  Future<void> assignVolunteer({
    required String festivalId,
    required String volunteerId,
  });
  Future<void> removeVolunteer({
    required String festivalId,
    required String volunteerId,
  });
}
