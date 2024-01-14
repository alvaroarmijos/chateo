import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._getChatUseCase,
  ) : super(const ChatLoading()) {
    on<GetChatsEvent>(_onGetChatsEvent);
  }

  final GetChatUseCase _getChatUseCase;

  FutureOr<void> _onGetChatsEvent(
      GetChatsEvent event, Emitter<ChatState> emit) {
    final ids = [event.myUid, event.chatUserUid];
    ids.sort();
    final chatId = "${ids[0]}_${ids[1]}";
    return emit.forEach<List<Message>>(
      _getChatUseCase(chatId),
      onData: (data) => ChatSuccess(
        data,
        event.myUid,
      ),
      onError: (error, stackTrace) => const ChatError(),
    );
  }
}
