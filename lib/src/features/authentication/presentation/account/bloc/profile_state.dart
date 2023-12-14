abstract class ProfileState {
  const ProfileState();
}

class LoadedProfileState extends ProfileState {
  const LoadedProfileState();
}

class LoadingProfileState extends ProfileState {
  const LoadingProfileState();
}

class ErrorProfileState extends ProfileState {
  const ErrorProfileState();
}
