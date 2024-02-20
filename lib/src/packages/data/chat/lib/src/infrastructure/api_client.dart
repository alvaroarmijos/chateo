import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/api_dtos.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatApiClient {
  final FirebaseDatabase _firebaseDatabase;

  ChatApiClient(this._firebaseDatabase);

  Stream<List<ChatUserDto>> getChats() {
    return _firebaseDatabase
        .ref('status')
        .orderByChild("status")
        .onValue
        .map((event) => event.snapshot.value != null
            ? (event.snapshot.value as Map).map((key, value) {
                final newValue = value as Map;
                newValue['uid'] = key;
                return MapEntry(key, newValue);
              })
            : {})
        .map((event) => ChatUserDto.fromJsonArray(event.values.toList()));
  }

  Stream<List<MessageDto>> getChat(String chatId) {
    return _firebaseDatabase.ref('chats').child('$chatId/messages').onValue.map(
          (event) => MessageDto.fromJsonArray(
            event.snapshot.value != null
                ? (event.snapshot.value as Map).values.toList()
                : [],
          ),
        );
  }

  Future<void> sendMessages(
    String chatUid,
    String msg,
    String uid,
  ) {
    return _firebaseDatabase
        .ref('chats')
        .child('$chatUid/messages')
        .push()
        .set({
      'message': msg,
      'sentBy': uid,
      'messageDate': DateTime.now().toIso8601String(),
    });
  }
}
