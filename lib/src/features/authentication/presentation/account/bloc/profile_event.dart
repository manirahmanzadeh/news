import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class ChangeDisplayNameProfileEvent extends ProfileEvent {
  final String displayName;
  final BuildContext context;

  const ChangeDisplayNameProfileEvent({required this.displayName, required this.context});
}

class ChangeEmailProfileEvent extends ProfileEvent {
  final String email;
  final BuildContext context;

  const ChangeEmailProfileEvent({required this.email, required this.context});
}

class ChangePasswordProfileEvent extends ProfileEvent {
  final String password;
  final BuildContext context;

  const ChangePasswordProfileEvent({required this.password, required this.context});
}

class SendVerifyEmailProfileEvent extends ProfileEvent {
  final BuildContext context;

  const SendVerifyEmailProfileEvent({required this.context});
}

class ChangeProfilePhotoProfileEvent extends ProfileEvent {
  final File photo;
  final BuildContext context;

  const ChangeProfilePhotoProfileEvent({required this.photo, required this.context});
}
