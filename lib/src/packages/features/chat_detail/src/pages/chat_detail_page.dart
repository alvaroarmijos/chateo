import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/chateo_text_form_field.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/message_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_title.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({
    super.key,
    required this.userChatUid,
    required this.userChatName,
    this.userChatPhotoUrl,
    required this.userChatStatus,
  });

  final String userChatUid;
  final String userChatName;
  final String? userChatPhotoUrl;
  final bool userChatStatus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          userChatName: userChatName,
          userChatPhotoUrl: userChatPhotoUrl,
          userChatStatus: userChatStatus,
          textTheme: textTheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ChateoDimens.dimen_12),
        child: Stack(
          children: [
            ListView(
              children: const [
                MessageWidget(
                  msg: 'Hello',
                  mySelf: true,
                  hour: '09:25 AM',
                ),
                MessageWidget(
                  msg: 'How are you bro',
                  mySelf: false,
                  hour: '09:35 AM',
                ),
              ],
            ),
            ChateoTextFormField(
              onSend: (msg) => print(msg),
            ),
          ],
        ),
      ),
    );
  }
}
