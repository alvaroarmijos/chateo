import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? ChateoColors.grey;

    return Row(
      children: [
        const Flexible(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(ChateoDimens.dimen_12),
          child: Text(
            'OR',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: textColor),
          ),
        ),
        const Flexible(
          child: Divider(),
        ),
      ],
    );
  }
}
