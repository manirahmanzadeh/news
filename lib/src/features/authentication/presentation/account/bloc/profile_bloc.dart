import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_event.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_state.dart';
import 'package:news_app/src/features/authentication/presentation/bloc/auth/auth_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.context) : super(const LoadedProfileState());
  BuildContext context;

  String? getUserDisplayName() {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      return user.displayName;
    }
    return null;
  }

  bool get hasDisplayName => getUserDisplayName() != null;

  String? getUserEmail() {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    return user.email;
  }

  bool get hasEmail => getUserEmail() != null;

  String? getUserPhotoUrl() {
    final user = BlocProvider.of<AuthBloc>(context).getCurrentUser()!;
    return user.photoURL;
  }

  bool get hasPhoto => getUserPhotoUrl() != null;
}
