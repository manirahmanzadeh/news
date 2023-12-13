abstract class RegisterState {
  const RegisterState();
}

class LoadingRegisterState extends RegisterState {
  const LoadingRegisterState();
}

class LoadedRegisterState extends RegisterState {
  const LoadedRegisterState();
}

class ErrorRegisterState extends RegisterState {
  const ErrorRegisterState();
}
