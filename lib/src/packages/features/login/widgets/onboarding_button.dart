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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ChateoDimens.dimen_12), // <-- Radius
            ),
            padding: const EdgeInsets.symmetric(
              vertical: ChateoDimens.dimen_16,
              horizontal: ChateoDimens.dimen_32,
            ),
          ),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          child: const Text('Sign up with mail'),
        ),
      ),
    );
  }
}
