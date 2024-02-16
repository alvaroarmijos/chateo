import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user_repository.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/api_client.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/chat_user/chat_user_mapper.dart';

class ChatUserRepositoryImpl implements ChatUserRepository {
  final ChatApiClient _chatApiClient;
  final ChatUserMapper _mapper;

  ChatUserRepositoryImpl(
    this._chatApiClient,
    this._mapper,
  );

  @override
  Stream<List<ChatUser>> findAll() => _chatApiClient.getChats().map(
        (dtos) => _mapper.fromApiChatUserDtoList(dtos),
      );
}
