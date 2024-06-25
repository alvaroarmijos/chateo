import 'package:chateo/core/ui/ui.dart';
import 'package:chateo/features/login/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const OnboardingPage(),
    );
  }
}
