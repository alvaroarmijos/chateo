part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeSucces extends HomeState {
  const HomeSucces(
    this.chats,
    this.user,
  );

  final User? user;
  final List<ChatUser> chats;

  @override
  List<Object> get props => [chats];
}

final class HomeError extends HomeState {
  const HomeError();
}
