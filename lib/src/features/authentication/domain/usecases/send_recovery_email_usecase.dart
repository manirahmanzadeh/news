import 'package:news_app/src/core/usecases/usecase.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';

class SendRecoveryEmailUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  SendRecoveryEmailUseCase(this._authRepository);

  @override
  Future<void> call({String? params}) {
    return _authRepository.sendRecoveryEmail(params!);
  }
}
