import 'package:chateo/app/bloc/auth_bloc.dart';
import 'package:chateo/app/di.dart';
import 'package:chateo/core/ui/ui.dart';
import 'package:chateo/features/chat_detail/bloc/chat_bloc.dart';
import 'package:chateo/features/home/bloc/home_bloc.dart';
import 'package:chateo/features/home/page/home_page.dart';
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
  initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(GetUser()),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.existUser) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => HomeBloc(),
                  ),
                ],
                child: const HomePage(),
              );
            } else {
              return BlocProvider(
                create: (context) => SignInBloc(),
                child: const OnboardingPage(),
              );
            }
          },
        ),
      ),
    );
  }
}
