import 'package:chateo/src/app/bloc/app_bloc.dart';
import 'package:chateo/src/app/di/di.dart';
import 'package:chateo/src/app/navigator/chateo_flow.dart';
import 'package:chateo/src/app/navigator/onboarding_flow.dart';
import 'package:chateo/src/packages/core/ui/lib/src/res/theme.dart';
import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChateoApp extends StatelessWidget {
  const ChateoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
            create: (_) => sl<AppBloc>()..add(const StartAppEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ChateoTheme.light,
        home: const _AppContent(),
      ),
    );
  }
}

class _AppContent extends StatelessWidget {
  const _AppContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return (state.userExists)
            ? const ChateoFlow()
            : BlocProvider(
                create: (context) => sl<SignInBloc>(),
                child: const OnboardingFlow(),
              );
      },
    );
  }
}
