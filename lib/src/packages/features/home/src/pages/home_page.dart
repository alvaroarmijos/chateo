import 'package:chateo/src/packages/core/ui/lib/src/res/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChateoColors.black,
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
