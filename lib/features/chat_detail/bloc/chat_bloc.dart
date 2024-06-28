import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/data/messages/domain/message.dart';
import 'package:chateo/data/messages/domain/message_service.dart';
import 'package:get_it/get_it.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<GetChatEvent>(_onGetChatEvent);
  }

  final _messageService = GetIt.instance<MessageService>();

  FutureOr<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) {
    final date = DateTime.now().toIso8601String();
    //enviar el mensaje con el service
    _messageService.sendMessage(
      _generateChatId(event.uid, event.chatUserId),
      event.msg,
      date,
      event.uid,
    );
  }

  String _generateChatId(String myUid, String chatUserId) {
    final ids = [myUid, chatUserId];
    ids.sort();
    return '${ids[0]}_${ids[1]}';
  }

  FutureOr<void> _onGetChatEvent(
    GetChatEvent event,
    Emitter<ChatState> emit,
  ) {
    return emit.forEach(
        _messageService.getChat(_generateChatId(event.uid, event.chatUserId)),
        onData: (messages) {
      return ChatState(messages: messages);
    });
  }
}
