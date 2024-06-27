import 'package:chateo/core/ui/widgets/chateo_avatar.dart';
import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.chatUser,
  });

  final ChatUser chatUser;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ChateoAvatar(
              name: chatUser.name,
              photoUrl: chatUser.photoUrl,
            ),
            SizedBox(
              width: 12,
              height: 12,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: chatUser.status ? Colors.green : Colors.red,
              )),
            )
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text(
              chatUser.name,
              style: textTheme.labelLarge,
            ),
            subtitle: Text(
              chatUser.status ? 'Active now' : 'Offline',
              style: textTheme.bodySmall,
            ),
          ),
        )
      ],
    );
  }
}
