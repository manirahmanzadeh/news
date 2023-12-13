abstract class AuthState {
  const AuthState();
}

class LoadingAuthState extends AuthState {
  const LoadingAuthState();
}

class LoadedAuthState extends AuthState {
  const LoadedAuthState();
}

class ErrorAuthState extends AuthState {
  const ErrorAuthState();
}
