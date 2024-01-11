import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/login/widgets/login_divider.dart';
import 'package:chateo/src/packages/features/login/widgets/social_media_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(ChateoDimens.dimen_20),
            children: [
              const SizedBox(height: ChateoDimens.dimen_20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Log in',
                  style: textTheme.labelLarge?.copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 10,
                    decorationColor: theme.colorScheme.primary.withOpacity(0.7),
                  ),
                  children: [
                    TextSpan(
                      text: ' to Chateo',
                      style: textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ChateoDimens.dimen_20),
              Text(
                'Welcome back! Sign in using your social account or email to continue us',
                style: TextStyle(
                  color: ChateoColors.darkGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: ChateoDimens.dimen_24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(
                      icon: ChateoDrawables.getFacebookIconDrawable(),
                      borderColor: ChateoColors.black,
                      onTap: () {},
                    ),
                    const SizedBox(width: ChateoDimens.dimen_20),
                    SocialMediaButton(
                      icon: ChateoDrawables.getGoogleIconDrawable(),
                      borderColor: ChateoColors.black,
                      onTap: () {},
                    ),
                    const SizedBox(width: ChateoDimens.dimen_20),
                    SocialMediaButton(
                      icon: ChateoDrawables.getAppleDarkIconDrawable(),
                      borderColor: ChateoColors.black,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              LoginDivider(
                color: ChateoColors.darkGrey,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('Your email'),
                ),
              ),
              const SizedBox(height: ChateoDimens.dimen_16),
              TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              const SizedBox(height: ChateoDimens.dimen_92),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ChateoDimens.dimen_20,
                ).copyWith(
                  bottom: ChateoDimens.dimen_48,
                ),
                child: const ElevatedButton(
                  onPressed: null,
                  child: Text('Log in'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
