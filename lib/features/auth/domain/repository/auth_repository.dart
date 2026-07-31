import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  User? get currentUser;
  Stream<User?> get authStateChanges;
  Future<User> signIn(String email, String password);
  Future<User> signUp({
    required String email,
    required String password,
    required String displayName,
  });
  Future<void> signOut();
}
