import 'package:news_app/src/core/usecases/usecase.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';

class SignInWithGoogleUseCase implements UseCase<void, void> {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  @override
  Future<void> call({void params}) {
    return _authRepository.signIngWithGoogle();
  }
}
