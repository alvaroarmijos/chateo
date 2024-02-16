import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.msg,
    required this.mySelf,
    required this.name,
    this.photoUrl,
  });

  final String msg;
  final String name;
  final bool mySelf;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          mySelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: ChateoDimens.dimen_20),
          child: ChateoAvatar(
            name: name,
            photoUrl: photoUrl,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: ChateoDimens.dimen_8,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: ChateoDimens.dimen_8,
                horizontal: ChateoDimens.dimen_12,
              ),
              decoration: BoxDecoration(
                color: mySelf ? ChateoColors.primary : ChateoColors.chatColor,
                borderRadius: BorderRadius.only(
                  topLeft: mySelf
                      ? const Radius.circular(ChateoDimens.dimen_12)
                      : Radius.zero,
                  topRight: !mySelf
                      ? const Radius.circular(ChateoDimens.dimen_12)
                      : Radius.zero,
                  bottomLeft: const Radius.circular(ChateoDimens.dimen_12),
                  bottomRight: const Radius.circular(ChateoDimens.dimen_12),
                ),
              ),
              child: Text(
                msg,
                style: TextStyle(
                  color: mySelf ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: ChateoDimens.dimen_8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '18:00',
                  style: textTheme.bodySmall?.copyWith(
                    color: ChateoColors.darkGrey,
                  ),
                  // textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
