import 'package:avatars/avatars.dart';
import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ChateoAvatar extends StatelessWidget {
  const ChateoAvatar({
    super.key,
    this.photoUrl,
    required this.name,
    this.radius,
  });

  final String? photoUrl;
  final String name;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final radius = this.radius ?? ChateoDimens.dimen_20;

    return photoUrl == null
        ? Avatar(
            name: name,
            shape: AvatarShape.circle(radius),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(photoUrl!),
            maxRadius: radius,
          );
  }
}
