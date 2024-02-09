import 'package:chateo/src/packages/features/login/widgets/onboarding_divider.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';
import '../widgets/social_media_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Log in to Chateo'),
            const Text(
                'Welcome back! Sign in using your social account or email to continue us'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton(
                  iconPath: ChateDrawables.getFacebookIconDrawable(),
                ),
                const SizedBox(
                  width: ChateoDimens.dimen_16,
                ),
                SocialMediaButton(
                  iconPath: ChateDrawables.getGoogleIconDrawable(),
                ),
                const SizedBox(
                  width: ChateoDimens.dimen_16,
                ),
                SocialMediaButton(
                  iconPath: ChateDrawables.getAppleIconDrawable(),
                ),
              ],
            ),
            OnboardingDivider(
              color: ChateoColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
