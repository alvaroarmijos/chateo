import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({
    super.key,
    required this.messages,
    required this.myUid,
  });

  final List<Message> messages;
  final String myUid;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) => MessageWidget(
        msg: messages[index].msg,
        hour: messages[index].date,
        mySelf: messages[index].sentBy == myUid,
      ),
    );
  }
}
