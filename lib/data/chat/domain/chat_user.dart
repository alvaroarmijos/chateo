// To parse this JSON data, do
//
//     final chatUser = chatUserFromJson(jsonString);

import 'dart:convert';

ChatUser chatUserFromJson(String str) => ChatUser.fromJson(json.decode(str));

String chatUserToJson(ChatUser data) => json.encode(data.toJson());

class ChatUser {
  String uid;
  String name;
  String? photoUrl;
  bool status;

  ChatUser({
    required this.uid,
    required this.name,
    this.photoUrl,
    required this.status,
  });

  factory ChatUser.fromJson(Map json) => ChatUser(
        uid: json["uid"],
        name: json["name"],
        photoUrl: json["photoUrl"],
        status: json["status"],
      );

  static List<ChatUser> fromJsonArray(List jsonArray) => jsonArray
      .map(
        (e) => ChatUser.fromJson(e),
      )
      .toList();

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "photoUrl": photoUrl,
        "status": status,
      };
}
