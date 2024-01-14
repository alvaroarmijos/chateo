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
