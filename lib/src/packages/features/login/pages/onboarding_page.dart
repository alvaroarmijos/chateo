import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(ChateDrawables.getOnbordingBackgroundDrawable()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(ChateoDimens.dimen_20),
              child: Column(
                children: [
                  Image.asset(
                    ChateDrawables.getAppIconDrawable(),
                  ),
                  Text(
                    'Connect friends easily & quickly',
                    style: textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: ChateoDimens.dimen_8,
                  ),
                  Text(
                    'Our chat app is the perfect way to stay connected with friends and family.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: ChateoColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
