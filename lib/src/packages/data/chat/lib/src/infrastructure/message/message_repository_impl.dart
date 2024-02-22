import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final ChatApiClient _chatApiClient;
  final MessageMapper _mapper;

  MessageRepositoryImpl(
    this._chatApiClient,
    this._mapper,
  );

  @override
  Future<void> sendMessage(
    String chatUid,
    String msg,
    String sentBy,
    String sentTo,
  ) =>
      _chatApiClient.sendMessages(
        chatUid,
        msg,
        sentBy,
        sentTo,
      );

  @override
  Stream<List<Message>> findAll(String chatId) =>
      _chatApiClient.getChat(chatId).map(
            (dtos) => _mapper.fromApiChatUserDtoList(dtos),
          );
}
