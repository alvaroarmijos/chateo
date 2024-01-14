import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.msg,
    required this.hour,
    required this.mySelf,
  });

  final String msg;
  final String hour;
  final bool mySelf;

  @override
  Widget build(BuildContext context) {
    final color = mySelf ? ChateoColors.primaryChat : ChateoColors.greyChat;
    final textColor = mySelf ? Colors.white : Colors.black;
    final maxWidth = MediaQuery.sizeOf(context).width * 0.6;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          mySelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!mySelf)
          const Padding(
            padding: EdgeInsets.only(right: ChateoDimens.dimen_20),
            child: ChateoAvatar(name: 'Alvaro'),
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              mySelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: ChateoDimens.dimen_8,
                horizontal: ChateoDimens.dimen_12,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: mySelf
                      ? const Radius.circular(ChateoDimens.dimen_12)
                      : Radius.zero,
                  topRight: mySelf
                      ? Radius.zero
                      : const Radius.circular(ChateoDimens.dimen_12),
                  bottomLeft: const Radius.circular(ChateoDimens.dimen_12),
                  bottomRight: const Radius.circular(ChateoDimens.dimen_12),
                ),
              ),
              child: Text(
                msg,
                style: TextStyle(
                  color: textColor,
                ),
                textAlign: mySelf ? TextAlign.right : TextAlign.left,
              ),
            ),
            const SizedBox(
              height: ChateoDimens.dimen_8,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: mySelf ? ChateoDimens.dimen_8 : 0,
                left: mySelf ? 0 : ChateoDimens.dimen_8,
              ),
              child: Text(
                hour,
                style: textTheme.bodySmall?.copyWith(
                  color: ChateoColors.darkGrey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
