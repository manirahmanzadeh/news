import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/forget_password_screen.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/login_screen.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/signup_screen.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.context) : super(const LoadedRegisterState());
  BuildContext context;

  final registerFormKey = GlobalKey<FormState>();

  String? email;
  String? password;

  onSavedEmail(String? value) {
    email = value;
  }

  onSavedPassword(String? value) {
    password = value;
  }

  submitLoginForm() {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      BlocProvider.of<AuthBloc>(context).add(
        SignInEmailPasswordAuthEvent(
          email: email!,
          password: password!,
          context: context,
        ),
      );
    }
  }

  submitSignUpForm() {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      BlocProvider.of<AuthBloc>(context).add(
        SignUpEmailPasswordAuthEvent(
          email: email!,
          password: password!,
          context: context,
        ),
      );
    }
  }

  submitForgetPasswordForm() {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      BlocProvider.of<AuthBloc>(context).add(
        SendRecoveryEmailAuthEvent(
          email: email!,
          context: context,
        ),
      );
    }
  }

  signInWithGoogle() {
    BlocProvider.of<AuthBloc>(context).add(
      SignInWithGoogleAuthEvent(
        context: context,
      ),
    );
  }

  signInWithFacebook() {
    BlocProvider.of<AuthBloc>(context).add(
      SignInWithFacebookAuthEvent(
        context: context,
      ),
    );
  }

  void goToSignUp() {
    Navigator.pushNamed(
      context,
      SignUpScreen.routeName,
    );
  }

  void goToSignIn() {
    Navigator.pushNamed(
      context,
      LoginScreen.routeName,
    );
  }

  void goToForgetPassword() {
    Navigator.pushNamed(
      context,
      ForgetPasswordScreen.routeName,
    );
  }
}
