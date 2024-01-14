import 'package:avatars/avatars.dart';
import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user.dart';
import 'package:flutter/material.dart';

class UserChatItem extends StatelessWidget {
  const UserChatItem({
    super.key,
    required this.chatUser,
  });

  final ChatUser chatUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(
        name: chatUser.name,
        shape: AvatarShape.circle(ChateoDimens.dimen_20),
      ),
      title: Text(
        chatUser.name,
      ),
      trailing: SizedBox(
        width: ChateoDimens.dimen_12,
        height: ChateoDimens.dimen_12,
        child: DecoratedBox(
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: chatUser.status ? Colors.green : Colors.red,
        )),
      ),
    );
  }
}
