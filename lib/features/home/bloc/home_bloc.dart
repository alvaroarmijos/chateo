import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/data/chat/domain/chat_service.dart';
import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

part 'home_event.dart';
part 'home_state.dart';

final _getIt = GetIt.instance;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetChatUsersEvent>(_onGetChatUsersEvent);
    on<UpdateUserStatusEvent>(_onUpdateUserStatusEvent);
  }

  final chatService = _getIt<ChatService>();

  FutureOr<void> _onGetChatUsersEvent(
    GetChatUsersEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(chatService.getChatUsers(), onData: (users) {
      users.removeWhere(
        (element) => element.uid == event.uid,
      );
      return HomeState(users: users);
    });
  }

  FutureOr<void> _onUpdateUserStatusEvent(
    UpdateUserStatusEvent event,
    Emitter<HomeState> emit,
  ) {
    chatService.updateUserStatus(
      event.user.uid,
      event.user.displayName ?? '',
      event.user.photoURL,
      event.status,
    );
  }
}
