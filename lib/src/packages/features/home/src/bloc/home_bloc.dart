import 'dart:async';

import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getChatUsersUseCase,
  ) : super(const HomeLoading()) {
    on<GetChatUsersEvent>(_onGetChatUsersEvent);
  }

  final GetChatUsersUseCase _getChatUsersUseCase;

  FutureOr<void> _onGetChatUsersEvent(
    GetChatUsersEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      _getChatUsersUseCase(),
      onData: (data) => HomeSucces(data),
      onError: (error, stackTrace) => const HomeError(),
    );
  }
}
