import 'package:flutter/cupertino.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class SignInEmailPasswordAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const SignInEmailPasswordAuthEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}

class SignUpEmailPasswordAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const SignUpEmailPasswordAuthEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}

class SignOutAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignOutAuthEvent({
    required this.context,
  });
}

class SendRecoveryEmailAuthEvent extends AuthEvent {
  final String email;
  final BuildContext context;

  const SendRecoveryEmailAuthEvent({
    required this.email,
    required this.context,
  });
}

class SignInWithGoogleAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignInWithGoogleAuthEvent({
    required this.context,
  });
}

class SignInWithFacebookAuthEvent extends AuthEvent {
  final BuildContext context;

  const SignInWithFacebookAuthEvent({
    required this.context,
  });
}
