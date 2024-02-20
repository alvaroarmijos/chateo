part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class SendMessageEvent extends ChatEvent {
  final String chatUserId;
  final String myUid;
  final String msg;

  const SendMessageEvent(this.chatUserId, this.myUid, this.msg);

  @override
  List<Object> get props => [chatUserId, myUid, msg];
}

final class GetChatEvent extends ChatEvent {
  final String chatUserId;
  final String myUid;

  const GetChatEvent(this.chatUserId, this.myUid);

  @override
  List<Object> get props => [chatUserId, myUid];
}
