import 'package:chateo/src/packages/data/chat/chat.dart';

class ChatUserRepositoryImpl extends ChatUserRepository {
  final ChatApiClient _chatApiClient;
  final ChatUserMapper _chatUserMapper;

  ChatUserRepositoryImpl(
    this._chatApiClient,
    this._chatUserMapper,
  );

  @override
  Stream<List<ChatUser>> findAll() => _chatApiClient
      .getChats()
      .map((dtos) => _chatUserMapper.fromApiChatUserDtoList(dtos));
}
