part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetChatUsersEvent extends HomeEvent {
  const GetChatUsersEvent();
}

final class UpdateUserStatusEvent extends HomeEvent {
  const UpdateUserStatusEvent(this.status);

  final bool status;

  @override
  List<Object> get props => [status];
}
