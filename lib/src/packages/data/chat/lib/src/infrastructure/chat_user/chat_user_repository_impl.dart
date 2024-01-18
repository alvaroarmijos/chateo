import 'package:chateo/src/packages/data/chat/chat.dart';

class ChatUserRepositoryImpl extends ChatUserRepository {
  final ChatApiClient _chatApiClient;
  final ChatUserMapper _chatUserMapper;

  ChatUserRepositoryImpl(
    this._chatApiClient,
    this._chatUserMapper,
  );

  @override
  Stream<List<ChatUser>> findAll() => _chatApiClient.getUserChats().map(
        (dtos) => _chatUserMapper.fromApiChatUserDtoList(dtos),
      );

  @override
  Future<void> updateById(
    String uid,
    String name,
    String? photoUrl,
    bool status,
    String? token,
  ) =>
      _chatApiClient.updateUserStatus(
        uid,
        name,
        photoUrl,
        status,
        token,
      );
}
