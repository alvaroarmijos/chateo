import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/login/widgets/onboarding_button.dart';
import 'package:chateo/src/packages/features/login/widgets/onboarding_divider.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(ChateoDrawables.getOnboardingBackgroundDrawable()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(ChateoDimens.dimen_20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(ChateoDrawables.getAppIconDrawable()),
                  const SizedBox(height: ChateoDimens.dimen_20),
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
                    style: textTheme.bodyMedium
                        ?.copyWith(color: ChateoColors.grey),
                  ),
                  const SizedBox(
                    height: ChateoDimens.dimen_12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: ChateoDimens.dimen_12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ChateoDrawables.getFacebookIconDrawable()),
                        const SizedBox(width: ChateoDimens.dimen_20),
                        Image.asset(ChateoDrawables.getGoogleIconDrawable()),
                        const SizedBox(width: ChateoDimens.dimen_20),
                        Image.asset(ChateoDrawables.getAppleIconDrawable()),
                      ],
                    ),
                  ),
                  const OnboardingDividier(),
                  OnboardingButton(
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: ChateoDimens.dimen_20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: TextStyle(color: ChateoColors.grey),
                        children: const [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
