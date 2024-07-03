import 'package:chateo/data/chat/domain/chat_service.dart';
import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatServiceImpl extends ChatService {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Stream<List<ChatUser>> getChatUsers() {
    return _firebaseDatabase.ref('status').onValue.map(
      (event) {
        if (event.snapshot.value != null) {
          return (event.snapshot.value as Map).map((key, value) {
            final newValue = value as Map;
            newValue['uid'] = key;
            return MapEntry(key, newValue);
          });
        } else {
          return {};
        }
      },
    ).map((data) => ChatUser.fromJsonArray(data.values.toList()));
  }

  @override
  Future<void> updateUserStatus(
    String uid,
    String name,
    String? photoUrl,
    bool status,
    String? token,
  ) {
    return _firebaseDatabase.ref("status").child(uid).update(
      {
        'name': name,
        'photoUrl': photoUrl,
        'status': status,
        'token': token,
      },
    );
  }
}
