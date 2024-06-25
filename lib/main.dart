import 'package:chateo/core/ui/ui.dart';
import 'package:chateo/features/login/bloc/sign_in/sign_in_bloc.dart';
import 'package:chateo/features/login/pages/pages.dart';
import 'package:chateo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: BlocProvider(
        create: (context) => SignInBloc(),
        child: const OnboardingPage(),
      ),
    );
  }
}
