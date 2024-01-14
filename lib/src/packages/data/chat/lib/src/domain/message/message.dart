import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String msg;
  final DateTime date;
  final String sentBy;

  const Message({
    required this.msg,
    required this.date,
    required this.sentBy,
  });

  @override
  List<Object?> get props => [
        msg,
        date,
        sentBy,
      ];
}
