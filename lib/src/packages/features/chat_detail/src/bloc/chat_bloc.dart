import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._sendMessageUseCase,
    this._getChatUseCase,
  ) : super(const ChatLoading()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<GetChatEvent>(_onGetChatEvent);
  }

  final SendMessageUseCase _sendMessageUseCase;
  final GetChatUseCase _getChatUseCase;

  FutureOr<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) {
    return emit.onEach(
        _sendMessageUseCase(
          getChatId(event.myUid, event.chatUserId),
          event.msg,
          event.myUid,
          event.chatUserId,
        ).asStream(),
        onData: (_) {});
  }

  String getChatId(String myUid, String chatUserId) {
    final ids = [myUid, chatUserId];
    ids.sort();
    return '${ids[0]}_${ids[1]}';
  }

  FutureOr<void> _onGetChatEvent(
    GetChatEvent event,
    Emitter<ChatState> emit,
  ) {
    return emit.forEach(
      _getChatUseCase(
        getChatId(
          event.myUid,
          event.chatUserId,
        ),
      ),
      onData: (messages) => ChatSuccess(messages, event.myUid),
      onError: (_, __) => const ChatError(),
    );
  }
}
