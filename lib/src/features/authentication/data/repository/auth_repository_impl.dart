import 'package:news_app/src/features/authentication/data/data_sources/firebase_auth_service.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _authService;

  const AuthRepositoryImpl(this._authService);

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
  Future<bool> isLoggedIn() async {
    return _authService.currentUser != null;
  }
}