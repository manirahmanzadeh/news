import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> createUserWithEmailAndPassword(String email, String password);

  Future<void> signOut();

  bool isLoggedIn();

  User? getCurrentUser();

  Future<void> sendRecoveryEmail(String email);
}
