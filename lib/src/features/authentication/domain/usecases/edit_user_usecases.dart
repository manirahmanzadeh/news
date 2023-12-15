import 'dart:io';

import 'package:news_app/src/core/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class ChangeDisplayNameUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  ChangeDisplayNameUseCase(this._authRepository);

  @override
  Future<void> call({String? params}) {
    return _authRepository.changeDisplayName(params!);
  }
}

class ChangePasswordUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  ChangePasswordUseCase(this._authRepository);

  @override
  Future<void> call({String? params}) {
    return _authRepository.changePassword(params!);
  }
}

class ChangeEmailUseCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  ChangeEmailUseCase(this._authRepository);

  @override
  Future<void> call({String? params}) {
    return _authRepository.changeEmail(params!);
  }
}

class SendVerifyEmailUseCase implements UseCase<void, void> {
  final AuthRepository _authRepository;

  SendVerifyEmailUseCase(this._authRepository);

  @override
  Future<void> call({void params}) {
    return _authRepository.sendVerifyEmail();
  }
}

class ChangeProfilePhotoUseCase implements UseCase<void, File> {
  final AuthRepository _authRepository;

  ChangeProfilePhotoUseCase(this._authRepository);

  @override
  Future<void> call({File? params}) {
    return _authRepository.saveProfilePhoto(params!);
  }
}
