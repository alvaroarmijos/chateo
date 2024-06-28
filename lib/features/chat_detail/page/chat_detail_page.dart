import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:chateo/features/chat_detail/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({
    super.key,
    required this.chatUser,
  });

  final ChatUser chatUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          chatUser: chatUser,
        ),
      ),
      body: Stack(
        children: [
          // List de mensajes
          ListMessages(
            chatUser: chatUser,
          ),
          // Widget
          ChatTextFormField(
            chatUserId: chatUser.uid,
          ),
        ],
      ),
    );
  }
}
