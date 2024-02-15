import 'package:chateo/firebase_options.dart';
import 'package:chateo/src/app/di/di.dart';
import 'package:chateo/src/packages/core/ui/lib/src/res/theme.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './src/app/di/di.dart' as di;
import 'src/app/chateo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<LoginBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<SignInBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<SignUpBloc>(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ChateoTheme.light,
      debugShowCheckedModeBanner: false,
      home: const ChateoApp(),
    );
  }
}
