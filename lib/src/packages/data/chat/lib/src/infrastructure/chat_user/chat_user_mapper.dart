import 'package:chateo/src/packages/data/chat/chat.dart';

class ChatUserMapper {
  const ChatUserMapper();

  ChatUser fromApiChatUserDto(ChatUserDto dto) {
    final uid = dto.uid;
    final name = dto.name;
    final status = dto.status;

    return ChatUser(
      uid: uid,
      name: name,
      status: status,
    );
  }

  List<ChatUser> fromApiChatUserDtoList(List<ChatUserDto> dtos) =>
      dtos.map((dto) => fromApiChatUserDto(dto)).toList();
}
