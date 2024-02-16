import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user_repository.dart';

class GetChatUserUseCase {
  const GetChatUserUseCase(this._chatUserRepository);

  final ChatUserRepository _chatUserRepository;

  Stream<List<ChatUser>> call() => _chatUserRepository.findAll();
}
