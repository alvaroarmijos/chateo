import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/home/src/widgets/user_chats_list.dart';
import 'package:flutter/material.dart';

import '../../../../data/chat/chat.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.chats});

  final List<ChatUser> chats;

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
                    child: Container(
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
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
