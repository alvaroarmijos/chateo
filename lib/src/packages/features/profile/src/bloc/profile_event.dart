part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class GetUserEvent extends ProfileEvent {
  const GetUserEvent();
}

final class LogOutEvent extends ProfileEvent {
  const LogOutEvent(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
