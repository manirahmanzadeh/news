import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/authentication/presentation/bloc/auth_event.dart';
import 'package:news_app/src/features/authentication/presentation/bloc/auth_state.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/login_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/home/screens/home_screen.dart';

import '../../domain/usecases/signin_email_password.dart';
import '../../domain/usecases/signout.dart';
import '../../domain/usecases/signup_email_password.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthBloc(
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signOutUseCase,
  ) : super(const LoadedAuthState()) {
    on<SignInEmailPasswordAuthEvent>(_onSignInEmailPassword);
    on<SignUpEmailPasswordAuthEvent>(_onSignUpEmailPassword);
    on<SignOutAuthEvent>(_onSignOut);
  }

  _onSignInEmailPassword(SignInEmailPasswordAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());
    try {
      await _signInWithEmailAndPasswordUseCase(params: {
        'email': event.email,
        'password': event.password,
      });
    } catch (e) {
      emit(const ErrorAuthState());
    }
    emit(const LoadedAuthState());
    Navigator.pushNamed(
      event.context,
      HomeScreen.routeName,
    );
  }

  _onSignUpEmailPassword(SignUpEmailPasswordAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());
    try {
      await _signUpWithEmailAndPasswordUseCase(params: {
        'email': event.email,
        'password': event.password,
      });
    } catch (e) {
      emit(const ErrorAuthState());
    }
    emit(const LoadedAuthState());
    Navigator.pushNamed(
      event.context,
      HomeScreen.routeName,
    );
  }

  _onSignOut(SignOutAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());
    try {
      await _signOutUseCase();
    } catch (e) {
      emit(const ErrorAuthState());
    }
    emit(const LoadedAuthState());
    Navigator.pushNamed(
      event.context,
      LoginScreen.routeName,
    );
  }
}
