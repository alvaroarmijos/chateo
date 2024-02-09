import 'package:chateo/src/packages/core/ui/lib/src/res/theme.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ChateoTheme.light,
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}
