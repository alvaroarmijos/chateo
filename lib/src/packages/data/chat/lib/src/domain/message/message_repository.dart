import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message.dart';

abstract class MessageRepository {
  Stream<List<Message>> findAll(String chatId);

  Future<void> sendMessage(String chatUid, String msg, String uid);
}
