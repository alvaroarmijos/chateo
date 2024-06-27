import 'package:chateo/data/chat/domain/chat_user.dart';

abstract class ChatService {
  Stream<List<ChatUser>> getChatUsers();

  Future<void> updateUserStatus(
    String uid,
    String name,
    String? photoUrl,
    bool status,
  );
}
