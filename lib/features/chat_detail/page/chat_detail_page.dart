import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:chateo/features/chat_detail/widgets/app_bar_title.dart';
import 'package:chateo/features/chat_detail/widgets/chat_text_form_field.dart';
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
      body: const Stack(
        children: [
          // List de mensajes
          // Widget
          ChatTextFormField(),
        ],
      ),
    );
  }
}
