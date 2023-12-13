import 'package:news_app/src/core/usecases/usecase.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase implements UseCase<void, Map<String, dynamic>> {
  final AuthRepository _authRepository;

  SignInWithEmailAndPasswordUseCase(this._authRepository);

  @override
  Future<void> call({Map<String, dynamic>? params}) {
    return _authRepository.signInWithEmailAndPassword(params!['email'], params['password']);
  }
}
