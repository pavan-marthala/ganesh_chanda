import 'package:injectable/injectable.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import '../datasource/volunteer_remote_data_source.dart';
import '../../domain/repository/volunteer_repository.dart';

@LazySingleton(as: VolunteerRepository)
class VolunteerRepositoryImpl implements VolunteerRepository {
  final VolunteerRemoteDataSource _remoteDataSource;

  VolunteerRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<AppUser>> getVolunteers(String communityId) async {
    try {
      return await _remoteDataSource.getVolunteers(communityId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AppUser>> getVolunteersByIds(List<String> volunteerIds) async {
    try {
      return await _remoteDataSource.getVolunteersByIds(volunteerIds);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppUser> addVolunteer(AppUser volunteer, String communityId) async {
    try {
      return await _remoteDataSource.addVolunteer(volunteer, communityId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppUser> updateVolunteer(AppUser volunteer) async {
    try {
      return await _remoteDataSource.updateVolunteer(volunteer);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> activateVolunteer(String userId) async {
    try {
      await _remoteDataSource.activateVolunteer(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deactivateVolunteer(String userId) async {
    try {
      await _remoteDataSource.deactivateVolunteer(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteVolunteer(String userId) async {
    try {
      await _remoteDataSource.deleteVolunteer(userId);
    } catch (e) {
      rethrow;
    }
  }
}
