import 'package:avatars/avatars.dart';
import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ChateoAvatar extends StatelessWidget {
  const ChateoAvatar({
    super.key,
    this.photoUrl,
    required this.name,
  });

  final String? photoUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return photoUrl == null
        ? Avatar(
            name: name,
            shape: AvatarShape.circle(ChateoDimens.dimen_20),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(photoUrl!),
          );
  }
}
