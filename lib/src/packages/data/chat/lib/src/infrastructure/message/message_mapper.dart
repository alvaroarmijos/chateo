import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/api_dtos.dart';

class MessageMapper {
  const MessageMapper();

  Message fromApiChatUserDto(MessageDto dto) {
    final msg = dto.msg;
    final date = dto.date;
    final sentBy = dto.sentBy;

    return Message(
      msg: msg,
      date: DateTime.parse(date),
      sentBy: sentBy,
    );
  }

  List<Message> fromApiChatUserDtoList(List<MessageDto> dtos) =>
      dtos.map((dto) => fromApiChatUserDto(dto)).toList();
}
