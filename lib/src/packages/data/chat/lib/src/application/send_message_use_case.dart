import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message_repository.dart';

class SendMessageUseCase {
  const SendMessageUseCase(this._messageRepository);

  final MessageRepository _messageRepository;

  Future<void> call(
    String chatUid,
    String msg,
    String sentBy,
    String sentTo,
  ) =>
      _messageRepository.sendMessage(
        chatUid,
        msg,
        sentBy,
        sentTo,
      );
}
