import 'package:chateo/src/packages/core/utils/lib/src/extensions/extensions.dart';

class ChatUserDto {
  final String uid;
  final String name;
  final String? photoUrl;
  final bool status;

  ChatUserDto({
    required this.uid,
    required this.name,
    required this.photoUrl,
    required this.status,
  });

  factory ChatUserDto.fromJson(Map jsonObj) {
    final String uid = jsonObj['uid'];
    final String name = jsonObj['name'];
    final String? photoUrl = jsonObj['photoUrl'];
    final bool status = jsonObj['status'];

    return ChatUserDto(
      uid: uid,
      name: name,
      photoUrl: photoUrl,
      status: status,
    );
  }

  static List<ChatUserDto> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => ChatUserDto.fromJson(e)).toList();
}

class MessageDto {
  final String msg;
  final String date;
  final String sentBy;

  const MessageDto(
    this.msg,
    this.date,
    this.sentBy,
  );

  factory MessageDto.fromJson(Map jsonObj) {
    final String message = jsonObj['message'];
    final String date = jsonObj['messageDate'];
    final String sentBy = jsonObj['sentBy'];

    return MessageDto(
      message,
      date,
      sentBy,
    );
  }

  static List<MessageDto> fromJsonArray(List jsonArray) => jsonArray
      .map((e) => MessageDto.fromJson(e))
      .sortedBy((messages) => messages.date)
      .toList();
}
