import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/home/src/widgets/user_chat_item.dart';
import 'package:flutter/material.dart';

import '../../../../data/chat/chat.dart';

class UserChatsList extends StatelessWidget {
  const UserChatsList({
    super.key,
    required this.chats,
  });

  final List<ChatUser> chats;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.8;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: ChateoDimens.dimen_40,
        horizontal: ChateoDimens.dimen_12,
      ),
      height: height,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ChateoDimens.dimen_40),
            topRight: Radius.circular(ChateoDimens.dimen_40),
          )),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => UserChatItem(
          chatUser: chats[index],
        ),
      ),
    );
  }
}
