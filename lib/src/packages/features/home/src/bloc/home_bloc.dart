import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getChatUsersUseCase,
    this._getUserUseCase,
  ) : super(const HomeLoading()) {
    on<GetChatUsersEvent>(_onGetChatUsersEvent);
  }

  final GetChatUsersUseCase _getChatUsersUseCase;
  final GetUserUseCase _getUserUseCase;

  FutureOr<void> _onGetChatUsersEvent(
    GetChatUsersEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      Rx.combineLatest2(_getUserUseCase(), _getChatUsersUseCase(),
          (user, chats) => (user, chats)),
      onData: (data) => HomeSucces(data.$2, data.$1),
      onError: (error, stackTrace) => const HomeError(),
    );
  }
}
