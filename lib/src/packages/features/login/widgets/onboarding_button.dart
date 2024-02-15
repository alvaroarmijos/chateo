import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ChateoDimens.dimen_16),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ChateoDimens.dimen_16,
            horizontal: ChateoDimens.dimen_32,
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          child: const Text('Sign up with mail'),
        ),
      ),
    );
  }
}
