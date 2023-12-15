import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/src/features/authentication/data/data_sources/firebase_auth_service.dart';
import 'package:news_app/src/features/authentication/data/data_sources/firebase_storage_service.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _authService;
  final FirebaseStorageService _storageService;

  const AuthRepositoryImpl(this._authService, this._storageService);

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await _authService.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authService.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  @override
  bool isLoggedIn() {
    return _authService.currentUser != null;
  }

  @override
  User? getCurrentUser() {
    return _authService.currentUser;
  }

  @override
  Future<void> sendRecoveryEmail(String email) {
    return _authService.sendRecoveryEmail(email: email);
  }

  @override
  Future<void> signIngWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    return _authService.signInWithCredentials(facebookAuthCredential);
  }

  @override
  Future<void> signIngWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await _authService.signInWithCredentials(credential);
  }

  @override
  Future<void> changeDisplayName(String displayName) {
    return _authService.changeDisplayName(displayName);
  }

  @override
  Future<void> changeEmail(String email) {
    return _authService.changeEmail(email);
  }

  @override
  Future<void> changePassword(String password) {
    return _authService.changePassword(password);
  }

  @override
  Future<void> sendVerifyEmail() {
    return _authService.sendVerificationEmail();
  }

  @override
  Future<void> saveProfilePhoto(File photo) async {
    final downloadUrl = await _storageService.uploadProfilePhoto(photo, _authService.currentUser!);
    await _authService.changeProfilePhoto(downloadUrl);
  }
}
