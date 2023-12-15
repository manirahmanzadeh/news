import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/authentication/domain/usecases/edit_user_usecases.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_event.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_state.dart';
import 'package:news_app/src/features/authentication/presentation/account/screens/changename_screen.dart';
import 'package:news_app/src/features/authentication/presentation/account/screens/email_screen.dart';
import 'package:news_app/src/features/authentication/presentation/bloc/auth/auth_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ChangeDisplayNameUseCase _changeDisplayNameUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final ChangeEmailUseCase _changeEmailUseCase;
  final SendVerifyEmailUseCase _sendVerifyEmailUseCase;

  ProfileBloc(
    this._changeDisplayNameUseCase,
    this._changePasswordUseCase,
    this._changeEmailUseCase,
    this._sendVerifyEmailUseCase,
  ) : super(const LoadedProfileState()) {
    on<ChangeDisplayNameProfileEvent>(_onChangeDisplayNameEvent);
    on<ChangePasswordProfileEvent>(_onChangePasswordEvent);
    on<ChangeEmailProfileEvent>(_onChangeEmailEvent);
    on<SendVerifyEmailProfileEvent>(_onSendVerifyEmailEvent);
  }

  final formKey = GlobalKey<FormState>();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name can not be empty';
    }
    return null;
  }

  String? getUserDisplayName(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      return user.displayName;
    }
    return null;
  }

  bool hasDisplayName(BuildContext context) => getUserDisplayName(context) != null;

  String? getUserEmail(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    return user.email;
  }

  bool hasEmail(BuildContext context) => getUserEmail(context) != null;

  String? getUserPhotoUrl(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    return user.photoURL;
  }

  bool hasPhoto(BuildContext context) => getUserPhotoUrl(context) != null;

  bool verifyNeed(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    if (user.email != null && !user.emailVerified) {
      return true;
    }
    return false;
  }

  String? name;
  String? email;

  onNameSaved(String? value) {
    name = value;
  }

  onEmailSaved(String? value) {
    email = value;
  }

  submitChangeDisplayNameForm(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      add(ChangeDisplayNameProfileEvent(displayName: name!, context: context));
    }
  }

  submitChangeEmailForm(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      add(ChangeEmailProfileEvent(email: email!, context: context));
    }
  }

  verifyEmail(BuildContext context) {
    add(SendVerifyEmailProfileEvent(context: context));
  }

  _onChangeDisplayNameEvent(ChangeDisplayNameProfileEvent event, Emitter<ProfileState> emit) async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      emit(const LoadingProfileState());
      try {
        await _changeDisplayNameUseCase(params: event.displayName);
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('Changes Submitted!')));
      } catch (e) {
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  _onChangeEmailEvent(ChangeEmailProfileEvent event, Emitter<ProfileState> emit) async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      emit(const LoadingProfileState());
      try {
        await _changeEmailUseCase(params: event.email);
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('Email Changed! You need to verify it now')));
      } catch (e) {
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  _onChangePasswordEvent(ChangePasswordProfileEvent event, Emitter<ProfileState> emit) async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      emit(const LoadingProfileState());
      try {
        await _changePasswordUseCase(params: event.password);
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('Changes Submitted!')));
      } catch (e) {
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  _onSendVerifyEmailEvent(SendVerifyEmailProfileEvent event, Emitter<ProfileState> emit) async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      emit(const LoadingProfileState());
      try {
        await _sendVerifyEmailUseCase();
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('Verification Email is sent!')));
      } catch (e) {
        emit(const LoadedProfileState());
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  void goToChangeName(BuildContext context) {
    Navigator.pushNamed(
      context,
      ChangeNameScreen.routeName,
    );
  }

  void goToChangeEmail(BuildContext context) {
    Navigator.pushNamed(
      context,
      EmailScreen.routeName,
    );
  }
}