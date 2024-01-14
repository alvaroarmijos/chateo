import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final String uid;
  final String name;
  final String? photoUrl;
  final bool status;

  const ChatUser({
    required this.uid,
    required this.name,
    this.photoUrl,
    required this.status,
  });

  @override
  List<Object?> get props => [uid, name, photoUrl, status];
}
