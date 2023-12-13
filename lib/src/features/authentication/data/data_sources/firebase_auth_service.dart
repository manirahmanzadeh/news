import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut().onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> sendRecoveryEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithGoogle() async {
    await _firebaseAuth
        .signInWithRedirect(
          GoogleAuthProvider(),
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> signInWithFacebook() async {
    await _firebaseAuth
        .signInWithRedirect(
          FacebookAuthProvider(),
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }
}
