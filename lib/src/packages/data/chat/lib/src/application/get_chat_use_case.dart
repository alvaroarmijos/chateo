import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message_repository.dart';

class GetChatUseCase {
  final MessageRepository _messageRepository;

  const GetChatUseCase(this._messageRepository);

  Stream<List<Message>> call(String chatId) =>
      _messageRepository.findAll(chatId);
}
