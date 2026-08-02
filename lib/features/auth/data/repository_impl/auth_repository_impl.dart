import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganesh_chanda/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:ganesh_chanda/features/auth/domain/models/account_setup_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRepositoryImpl(this._remoteDataSource);

  Future<AppUser?> _fetchAppUser(User? firebaseUser) async {
    if (firebaseUser == null) return null;
    try {
      final doc = await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .get(GetOptions(source: .server));

      if (doc.exists && doc.data() != null) {
        return AppUser.fromJson(doc.data()!);
      } else {
        // Fallback default AppUser if doc doesn't exist yet
        return AppUser(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
          role: 'ADMIN',
          accountSetupStatus: AccountSetupStatus.adminRegistered,
        );
      }
    } catch (_) {
      return AppUser(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName ?? '',
        role: 'ADMIN',
        accountSetupStatus: AccountSetupStatus.adminRegistered,
      );
    }
  }

  @override
  Future<AppUser?> get currentAppUser =>
      _fetchAppUser(_remoteDataSource.currentUser);

  @override
  Stream<AppUser?> get appUserChanges =>
      _remoteDataSource.authStateChanges.asyncMap(_fetchAppUser);

  @override
  Future<AppUser> signIn(String email, String password) async {
    final firebaseUser = await _remoteDataSource.signIn(email, password);
    final appUser = await _fetchAppUser(firebaseUser);
    return appUser!;
  }

  @override
  Future<void> signOut() => _remoteDataSource.signOut();

  @override
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String displayName,
    bool isVolunteer = true,
    String? communityId,
  }) async {
    User? firebaseUser;
    try {
      firebaseUser = await _remoteDataSource.signUp(email, password);

      final userMap = {
        'userId': firebaseUser.uid,
        'displayName': displayName,
        'email': email,
        'phoneNumber': '',
        'photoUrl': '',
        'status': 'Available',
        'createdAt': FieldValue.serverTimestamp(),
        'lastLoginAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'createdBy': firebaseUser.uid,
        'role': isVolunteer ? 'VOLUNTEER' : 'ADMIN',
        'communityId': communityId,
        'isEmailVerified': true,
        'onboardingState': isVolunteer
            ? AccountSetupStatus.onboardingCompleted.toJson()
            : AccountSetupStatus.adminRegistered.toJson(),
      };

      await _firestore.collection('users').doc(firebaseUser.uid).set(userMap);

      return AppUser(
        id: firebaseUser.uid,
        email: email,
        displayName: displayName,
        role: 'ADMIN',
        accountSetupStatus: AccountSetupStatus.adminRegistered,
      );
    } catch (e) {
      if (firebaseUser != null) {
        try {
          await firebaseUser.delete();
        } catch (_) {}
      }
      rethrow;
    }
  }
}
