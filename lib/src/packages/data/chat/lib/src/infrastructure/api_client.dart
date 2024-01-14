import 'package:chateo/src/packages/data/chat/lib/src/domain/exceptions.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/api_dtos.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatApiClient {
  final FirebaseDatabase _instance;

  ChatApiClient(this._instance);

  Stream<List<ChatUserDto>> getChats() {
    try {
      return _instance
          .ref("status")
          .orderByChild("status")
          .onValue
          .map(
            (event) => event.snapshot.value != null
                ? (event.snapshot.value as Map).map((key, value) {
                    final newValue = value as Map;
                    newValue['uid'] = key;
                    return MapEntry(key, newValue);
                  })
                : {},
          )
          .map(
            (event) => ChatUserDto.fromJsonArray(event.values.toList()),
          );
    } catch (e) {
      throw ChatsException();
    }
  }

  Future<void> updateUserStatus(String uid, String name, bool status) {
    return _instance
        .ref("status")
        .child(uid)
        .update({'name': name, 'status': status});
  }
}
