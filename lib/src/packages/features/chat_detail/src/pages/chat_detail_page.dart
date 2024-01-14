import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

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
        title: Row(
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
        ),
      ),
      body: const Center(
        child: Text('Chat'),
      ),
    );
  }
}
