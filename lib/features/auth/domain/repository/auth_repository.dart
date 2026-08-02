import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> get currentAppUser;
  Stream<AppUser?> get appUserChanges;
  Future<AppUser> signIn(String email, String password);
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String displayName,
    bool isVolunteer = true,
    String? communityId,
  });
  Future<void> signOut();
}
