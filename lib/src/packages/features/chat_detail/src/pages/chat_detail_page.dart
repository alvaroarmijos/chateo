import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({
    super.key,
    required this.userChatUid,
    required this.userChatName,
    required this.userChatStatus,
  });

  final String userChatUid;
  final String userChatName;
  final bool userChatStatus;

  @override
  Widget build(BuildContext context) {
    print(userChatName);
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Chat'),
      ),
    );
  }
}
