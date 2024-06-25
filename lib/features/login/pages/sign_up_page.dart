import 'package:chateo/core/ui/colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Sign up with ',
                  style: textTheme.labelLarge,
                  children: [
                    TextSpan(
                      text: 'Email',
                      style: textTheme.labelLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 10,
                        decorationColor:
                            theme.colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Get chatting with friends and family today by signing up for our chat app!',
                style: TextStyle(
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text('Your name'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text(
                    'Your email',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text(
                    'Confirm Password',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(
          bottom: 52,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Create an account'),
        ),
      ),
    );
  }
}
