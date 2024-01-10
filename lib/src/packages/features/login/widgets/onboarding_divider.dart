import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

class OnboardingDividier extends StatelessWidget {
  const OnboardingDividier({super.key});

  @override
  Widget build(BuildContext context) {
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
                .labelLarge
                ?.copyWith(color: ChateoColors.grey),
          ),
        ),
        const Flexible(
          child: Divider(),
        ),
      ],
    );
  }
}
