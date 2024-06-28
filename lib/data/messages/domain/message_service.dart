import 'package:chateo/data/messages/domain/message.dart';

abstract class MessageService {
  Future<void> sendMessage(
    String chatId,
    String msg,
    String date,
    String uid,
  );

  Stream<List<Message>> getChat(String chatId);
}
