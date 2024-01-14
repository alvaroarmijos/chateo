import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message_repository.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/api_client.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/message/message_mapper.dart';

class MessageRepositoryImpl extends MessageRepository {
  final ChatApiClient _chatApiClient;
  final MessageMapper _messageMapper;

  MessageRepositoryImpl(
    this._chatApiClient,
    this._messageMapper,
  );

  @override
  Stream<List<Message>> findAll(String chatId) => _chatApiClient
      .getChat(chatId)
      .map((dtos) => _messageMapper.fromApiChatUserDtoList(dtos));
}
