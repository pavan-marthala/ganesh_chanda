import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';

abstract class VolunteerRepository {
  Future<List<AppUser>> getVolunteers(String communityId);
  Future<List<AppUser>> getVolunteersByIds(List<String> volunteerIds);
  Future<AppUser> addVolunteer(AppUser volunteer, String communityId);
  Future<AppUser> updateVolunteer(AppUser volunteer);
  Future<void> activateVolunteer(String userId);
  Future<void> deactivateVolunteer(String userId);
  Future<void> deleteVolunteer(String userId);
}
