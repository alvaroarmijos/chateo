import 'package:chateo/core/ui/widgets/chateo_avatar.dart';
import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:chateo/features/chat_detail/page/chat_detail_page.dart';
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
      leading: ChateoAvatar(
        name: chatUser.name,
        photoUrl: chatUser.photoUrl,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: chatUser.status ? Colors.green : Colors.red,
        ),
        width: 16,
      ),
      title: Text(chatUser.name),
      subtitle: Text(chatUser.status ? 'Online' : 'Offline'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailPage(
              chatUser: chatUser,
            ),
          ),
        );
      },
    );
  }
}
