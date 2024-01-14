import 'package:avatars/avatars.dart';
import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/features/home/src/widgets/user_chats_list.dart';
import 'package:flutter/material.dart';

import '../../../../data/chat/chat.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.chats,
    required this.user,
  });

  final List<ChatUser> chats;
  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: ChateoDimens.dimen_32),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    'Home',
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: (user.photoUrl == null)
                        ? Avatar(
                            name: user.name,
                            shape: AvatarShape.circle(ChateoDimens.dimen_20),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                              user.photoUrl!,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
          UserChatsList(chats: chats),
        ],
      ),
    );
  }
}
