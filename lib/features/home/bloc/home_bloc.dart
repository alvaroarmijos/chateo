import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/data/chat/domain/chat_service.dart';
import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:get_it/get_it.dart';

part 'home_event.dart';
part 'home_state.dart';

final _getIt = GetIt.instance;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetChatUsers>(_onGetChatUsers);
  }

  final chatService = _getIt<ChatService>();

  FutureOr<void> _onGetChatUsers(
    GetChatUsers event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(chatService.getChatUsers(), onData: (users) {
      return HomeState(users: users);
    });
  }
}
