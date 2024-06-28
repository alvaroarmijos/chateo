import 'package:chateo/data/messages/domain/message.dart';
import 'package:chateo/data/messages/domain/message_service.dart';
import 'package:firebase_database/firebase_database.dart';

class MessageServiceImpl extends MessageService {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Future<void> sendMessage(
    String chatId,
    String msg,
    String date,
    String uid,
  ) {
    return _firebaseDatabase.ref('chats').child(chatId).push().set(
      {
        'message': msg,
        'messageDate': date,
        'sentBy': uid,
        'read': false,
      },
    );
  }

  @override
  Stream<List<Message>> getChat(String chatId) {
    return _firebaseDatabase
        .ref('chats')
        .child(chatId)
        .onValue
        .map(
          (databaseEvent) => databaseEvent.snapshot.value != null
              ? (databaseEvent.snapshot.value as Map).values.toList()
              : [],
        )
        .map((objectList) => Message.fromJsonArray(objectList));
  }
}
