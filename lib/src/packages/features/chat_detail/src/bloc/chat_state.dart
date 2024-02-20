part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatLoading extends ChatState {
  const ChatLoading();
}

final class ChatSuccess extends ChatState {
  const ChatSuccess(
    this.messages,
    this.myUid,
  );

  final List<Message> messages;
  final String myUid;

  @override
  List<Object> get props => [messages, myUid];
}

final class ChatError extends ChatState {
  const ChatError();
}
