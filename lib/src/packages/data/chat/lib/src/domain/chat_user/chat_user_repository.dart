import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user.dart';

abstract class ChatUserRepository {
  Stream<List<ChatUser>> findAll();

  Future<void> updateById(
    String uid,
    String name,
    bool status,
    String? photoUrl,
    String? token,
  );
}
