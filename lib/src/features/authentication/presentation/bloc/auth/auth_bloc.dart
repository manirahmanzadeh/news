import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/authentication/domain/usecases/get_current_user_usecase.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/login_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/home/screens/home_screen.dart';

import '../../../domain/usecases/signin_email_password.dart';
import '../../../domain/usecases/signout.dart';
import '../../../domain/usecases/signup_email_password.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthBloc(
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signOutUseCase,
    this._getCurrentUserUseCase,
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
      emit(const LoadedAuthState());
      Navigator.pushReplacementNamed(
        event.context,
        HomeScreen.routeName,
      );
    } catch (e) {
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      emit(const LoadedAuthState());
    }
  }

  _onSignUpEmailPassword(SignUpEmailPasswordAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());
    try {
      await _signUpWithEmailAndPasswordUseCase(params: {
        'email': event.email,
        'password': event.password,
      });
      emit(const LoadedAuthState());
      Navigator.pushReplacementNamed(
        event.context,
        HomeScreen.routeName,
      );
    } catch (e) {
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      emit(const LoadedAuthState());
    }
  }

  _onSignOut(SignOutAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());
    try {
      await _signOutUseCase();
      emit(const LoadedAuthState());
      Navigator.pushReplacementNamed(
        event.context,
        LoginScreen.routeName,
      );
    } catch (e) {
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      emit(const LoadedAuthState());
    }
  }

  User? getCurrentUser() {
    return _getCurrentUserUseCase();
  }
}
