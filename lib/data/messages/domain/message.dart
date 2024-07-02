class Message {
  final String msg;
  final DateTime date;
  final String sentBy;

  Message({
    required this.msg,
    required this.date,
    required this.sentBy,
  });

  factory Message.fromJson(Map json) => Message(
        msg: json["message"],
        date: DateTime.parse(json["messageDate"]),
        sentBy: json["sentBy"],
      );

  static List<Message> fromJsonArray(List jsonArray) => jsonArray
      .map(
        (e) => Message.fromJson(e),
      )
      .toList()
    ..sort((a, b) => a.date.compareTo(b.date));

  Map<String, dynamic> toJson() => {
        "message": msg,
        "messageDate": date,
        "sentBy": sentBy,
      };
}
