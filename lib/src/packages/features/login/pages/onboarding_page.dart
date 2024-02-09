import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/login/pages/login_page.dart';
import 'package:chateo/src/packages/features/login/widgets/onboarding_button.dart';
import 'package:chateo/src/packages/features/login/widgets/onboarding_divider.dart';
import 'package:chateo/src/packages/features/login/widgets/social_media_button.dart';
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
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ChateDrawables.getOnbordingBackgroundDrawable(),
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(ChateoDimens.dimen_20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: ChateoDimens.dimen_12,
                  ),
                  Image.asset(
                    ChateDrawables.getAppIconDrawable(),
                  ),
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Connect friends ',
                          style: textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'easily & quickly',
                              style: textTheme.displayLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: ChateoDimens.dimen_16,
                      ),
                      Text(
                        'Our chat app is the perfect way to stay connected with friends and family.',
                        style: textTheme.labelLarge?.copyWith(
                          color: ChateoColors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                        iconPath: ChateDrawables.getFacebookIconDrawable(),
                        borderColor: ChateoColors.grey,
                      ),
                      const SizedBox(
                        width: ChateoDimens.dimen_16,
                      ),
                      SocialMediaButton(
                        iconPath: ChateDrawables.getGoogleIconDrawable(),
                        borderColor: ChateoColors.grey,
                      ),
                      const SizedBox(
                        width: ChateoDimens.dimen_16,
                      ),
                      SocialMediaButton(
                        iconPath: ChateDrawables.getAppleIconDrawable(),
                        color: Colors.white,
                        borderColor: ChateoColors.grey,
                      ),
                    ],
                  ),
                  const OnboardingDivider(),
                  const OnboardingButton(),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage())),
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: textTheme.bodyLarge?.copyWith(
                          color: ChateoColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
