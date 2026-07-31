import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganesh_chanda/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:ganesh_chanda/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  User? get currentUser => _remoteDataSource.currentUser;

  @override
  Stream<User?> get authStateChanges =>
      _remoteDataSource.authStateChanges.map((user) => user);

  @override
  Future<User> signIn(String email, String password) async {
    return await _remoteDataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() => _remoteDataSource.signOut();

  @override
  Future<User> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    User? firebaseUser;
    try {
      firebaseUser = await _remoteDataSource.signUp(email, password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .set({
            'userId': firebaseUser.uid,
            'displayName': displayName,
            'email': email,
            'phoneNumber': '',
            'photoUrl': '',
            'status': 'Available',
            'createdAt': FieldValue.serverTimestamp(),
            'lastLoginAt': FieldValue.serverTimestamp(),
            'updatedAt': FieldValue.serverTimestamp(),
            "createdBy": firebaseUser.uid,
            "role": "ADMIN",
            "communityId": null,
            "isEmailVerified": true,
            "onboardingState": "ADMIN_REGISTERED",
          });

      return firebaseUser;
    } catch (e) {
      if (firebaseUser != null) {
        try {
          await firebaseUser.delete();
        } catch (_) {
          // Silent catch on rollback delete failure
        }
      }
      rethrow;
    }
  }
}
