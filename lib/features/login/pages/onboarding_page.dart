import 'package:chateo/core/ui/ui.dart';
import 'package:chateo/features/login/bloc/sign_in/sign_in_bloc.dart';
import 'package:chateo/features/login/pages/pages.dart';
import 'package:chateo/features/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fondo de la pagina
          Image.asset(
            Drawables.getAppBackground(),
            width: double.infinity,
            fit: BoxFit.contain,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Drawables.getAppIcon()),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Connect friends ',
                      style: TextStyle(
                        fontSize: 68,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'easily & quickly',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Our chat app is the perfect way to stay connected with friends and family.',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaWidget(
                        icon: Drawables.getFacebookIcon(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SocialMediaWidget(
                        icon: Drawables.getGoogleIcon(),
                        onTap: () {
                          context
                              .read<SignInBloc>()
                              .add(SignInWithGoogleEvent());
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SocialMediaWidget(
                        icon: Drawables.getAppleIcon(),
                      ),
                    ],
                  ),
                  const LoginDivider(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text('Sign up with mail'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
