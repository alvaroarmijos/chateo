part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class GetChatsEvent extends ChatEvent {
  const GetChatsEvent(
    this.chatUserUid,
    this.myUid,
  );

  final String chatUserUid;
  final String myUid;
}

final class SendMessageEvent extends ChatEvent {
  const SendMessageEvent(
    this.chatUserUid,
    this.myUid,
    this.msg,
  );

  final String chatUserUid;
  final String myUid;
  final String msg;
}
