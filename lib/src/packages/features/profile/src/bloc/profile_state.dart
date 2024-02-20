part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileSuccess extends ProfileState {
  const ProfileSuccess(
    this.user,
  );

  final User user;

  @override
  List<Object> get props => [user];
}

final class ProfileError extends ProfileState {
  const ProfileError();
}
