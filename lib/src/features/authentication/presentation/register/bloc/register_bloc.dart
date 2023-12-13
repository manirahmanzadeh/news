import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/bloc/auth/auth_bloc.dart';
import 'package:news_app/src/core/bloc/auth/auth_event.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.context) : super(const LoadedRegisterState());
  BuildContext context;

  final loginFormKey = GlobalKey<FormState>();

  String? email;
  String? password;

  onSavedEmail(String? value) {
    email = value;
  }

  onSavedPassword(String? value) {
    password = value;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Is Required!';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Is Required!';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters!';
    }
    return null;
  }

  submitLoginForm() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      BlocProvider.of<AuthBloc>(context).add(
        SignInEmailPasswordAuthEvent(
          email: email!,
          password: password!,
          context: context,
        ),
      );
    }
  }
}
