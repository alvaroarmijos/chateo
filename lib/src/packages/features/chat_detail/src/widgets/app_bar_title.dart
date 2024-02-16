import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.userChatName,
    required this.userChatPhotoUrl,
    required this.userChatStatus,
  });

  final String userChatName;
  final String? userChatPhotoUrl;
  final bool userChatStatus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Stack(
          children: [
            ChateoAvatar(
              name: userChatName,
              photoUrl: userChatPhotoUrl,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: ChateoDimens.dimen_12,
                height: ChateoDimens.dimen_12,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: userChatStatus ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        Flexible(
          child: ListTile(
            title: Text(
              userChatName,
              style: textTheme.labelLarge,
            ),
            subtitle: Text(
              userChatStatus ? 'Active now' : 'Inactive',
              style: textTheme.bodySmall,
            ),
          ),
        )
      ],
    );
  }
}
