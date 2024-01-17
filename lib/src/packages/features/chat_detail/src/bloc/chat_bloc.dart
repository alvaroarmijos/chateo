import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/data/chat/lib/src/application/send_message_use_case.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._getChatUseCase,
    this._sendMessageUseCase,
  ) : super(const ChatLoading()) {
    on<GetChatsEvent>(_onGetChatsEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  final GetChatUseCase _getChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  FutureOr<void> _onGetChatsEvent(
      GetChatsEvent event, Emitter<ChatState> emit) {
    return emit.forEach<List<Message>>(
      _getChatUseCase(getChatId(event.myUid, event.chatUserUid)),
      onData: (data) => ChatSuccess(
        data,
        event.myUid,
      ),
      onError: (error, stackTrace) => const ChatError(),
    );
  }

  FutureOr<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) {
    return emit.onEach(
      _sendMessageUseCase(
              getChatId(event.myUid, event.chatUserUid), event.msg, event.myUid)
          .asStream(),
      onData: (data) {},
    );
  }

  String getChatId(String myUid, String chatUserUid) {
    final ids = [myUid, chatUserUid];
    ids.sort();
    return "${ids[0]}_${ids[1]}";
  }
}
