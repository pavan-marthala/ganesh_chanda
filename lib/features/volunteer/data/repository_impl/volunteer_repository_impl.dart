import 'package:injectable/injectable.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import '../datasource/volunteer_remote_data_source.dart';
import '../../domain/repository/volunteer_repository.dart';

@LazySingleton(as: VolunteerRepository)
class VolunteerRepositoryImpl implements VolunteerRepository {
  final VolunteerRemoteDataSource _remoteDataSource;

  VolunteerRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<AppUser>> getVolunteers(String communityId) {
    return _remoteDataSource.getVolunteers(communityId);
  }

  @override
  Future<List<AppUser>> getVolunteersByIds(List<String> volunteerIds) {
    return _remoteDataSource.getVolunteersByIds(volunteerIds);
  }

  @override
  Future<AppUser> addVolunteer(AppUser volunteer, String communityId) {
    return _remoteDataSource.addVolunteer(volunteer, communityId);
  }

  @override
  Future<AppUser> updateVolunteer(AppUser volunteer) {
    return _remoteDataSource.updateVolunteer(volunteer);
  }

  @override
  Future<void> activateVolunteer(String userId) {
    return _remoteDataSource.activateVolunteer(userId);
  }

  @override
  Future<void> deactivateVolunteer(String userId) {
    return _remoteDataSource.deactivateVolunteer(userId);
  }

  @override
  Future<void> deleteVolunteer(String userId) {
    return _remoteDataSource.deleteVolunteer(userId);
  }
}
