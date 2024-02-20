import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message_repository.dart';

class GetChatUseCase {
  const GetChatUseCase(this._messageRepository);

  final MessageRepository _messageRepository;

  Stream<List<Message>> call(String chatUid) =>
      _messageRepository.findAll(chatUid);
}
