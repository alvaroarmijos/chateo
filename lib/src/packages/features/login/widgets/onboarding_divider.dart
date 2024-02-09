import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class OnboardingDivider extends StatelessWidget {
  const OnboardingDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? ChateoColors.lightGrey;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor.withOpacity(0.2),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: ChateoDimens.dimen_12),
          child: Text(
            'OR',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: dividerColor),
          ),
        ),
        Expanded(
            child: Divider(
          color: dividerColor.withOpacity(0.2),
        )),
      ],
    );
  }
}
