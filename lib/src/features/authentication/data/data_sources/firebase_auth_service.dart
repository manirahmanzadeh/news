import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/src/core/constants/constants.dart';

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

  Future<void> signInWithCredentials(AuthCredential credential) async {
    await _firebaseAuth
        .signInWithCredential(
          credential,
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> changeDisplayName(String displayName) async {
    await _firebaseAuth.currentUser
        ?.updateDisplayName(
          displayName,
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> changeEmail(String email) async {
    await _firebaseAuth.currentUser
        ?.updateEmail(
      email,
    )
        .onError((error, stackTrace) {
      print(error);
      throw (Exception(error));
    });
  }

  Future<void> changePassword(String password) async {
    await _firebaseAuth.currentUser
        ?.updatePassword(
          password,
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> changeProfilePhoto(String url) async {
    await _firebaseAuth.currentUser
        ?.updatePhotoURL(
          url,
        )
        .onError((error, stackTrace) => throw (Exception(error)));
  }

  Future<void> sendVerificationEmail() async {
    await _firebaseAuth.currentUser
        ?.sendEmailVerification(ActionCodeSettings(url: deeplLink))
        .onError((error, stackTrace) => throw (Exception(error)));
  }
}
