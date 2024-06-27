part of 'home_bloc.dart';

sealed class HomeEvent {}

final class GetChatUsersEvent extends HomeEvent {
  GetChatUsersEvent({required this.uid});

  final String uid;
}

final class UpdateUserStatusEvent extends HomeEvent {
  UpdateUserStatusEvent({
    required this.user,
    required this.status,
  });

  final bool status;
  final User user;
}
