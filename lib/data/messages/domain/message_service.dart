import 'package:chateo/data/messages/domain/message.dart';

abstract class MessageService {
  Future<void> sendMessage(
    String chatId,
    String msg,
    String date,
    String sentBy,
    String sentTo,
  );

  Stream<List<Message>> getChat(String chatId);
}
