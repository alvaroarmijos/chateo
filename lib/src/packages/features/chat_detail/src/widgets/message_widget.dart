import 'package:chateo/src/packages/core/ui/lib/src/res/strings.dart';
import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.msg,
    required this.mySelf,
    required this.name,
    required this.date,
    this.photoUrl,
  });

  final String msg;
  final String name;
  final bool mySelf;
  final String? photoUrl;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = mySelf ? ChateoColors.primaryChat : ChateoColors.chatColor;
    final textColor = mySelf ? Colors.white : Colors.black;
    const radius = Radius.circular(ChateoDimens.dimen_16);
    final hour = DateFormat(ChateoStrings.chat_dateFormat).format(date);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          mySelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!mySelf)
          Padding(
            padding: const EdgeInsets.only(right: ChateoDimens.dimen_16),
            child: ChateoAvatar(
              name: name,
              photoUrl: photoUrl,
            ),
          ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: ChateoDimens.dimen_12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!mySelf)
                    Text(
                      name,
                      style: textTheme.titleMedium,
                    ),
                  const SizedBox(
                    height: ChateoDimens.dimen_8,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                    ),
                    padding: const EdgeInsets.all(ChateoDimens.dimen_12),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: mySelf ? radius : Radius.zero,
                        topRight: !mySelf ? radius : Radius.zero,
                        bottomLeft: radius,
                        bottomRight: radius,
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
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: mySelf ? ChateoDimens.dimen_8 : 0,
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
