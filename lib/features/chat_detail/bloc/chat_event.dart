part of 'chat_bloc.dart';

sealed class ChatEvent {}

final class SendMessageEvent extends ChatEvent {
  SendMessageEvent({
    required this.chatUserId,
    required this.msg,
    required this.uid,
  });

  final String chatUserId;
  final String msg;
  final String uid;
}

final class GetChatEvent extends ChatEvent {
  GetChatEvent({required this.chatUserId, required this.uid});

  final String chatUserId;
  final String uid;
}
