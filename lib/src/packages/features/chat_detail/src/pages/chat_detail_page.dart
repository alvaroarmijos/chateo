import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/app_bar_title.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/chat_content.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({
    super.key,
    required this.userChatName,
    required this.userChatPhotoUrl,
    required this.userChatStatus,
    required this.myUid,
  });

  final String userChatName;
  final String? userChatPhotoUrl;
  final bool userChatStatus;
  final String myUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: AppBarTitle(
          userChatName: userChatName,
          userChatPhotoUrl: userChatPhotoUrl,
          userChatStatus: userChatStatus,
        )),
        body: ChatContent(
          messages: [
            Message(
                msg: 'Hola como estás afsdfasdfdfasdfas ',
                date: DateTime.now(),
                sentBy: 'fadsfasd')
          ],
          myUid: myUid,
          name: userChatName,
          photoUrl: userChatPhotoUrl,
        ));
  }
}
