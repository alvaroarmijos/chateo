import 'package:chateo/firebase_options.dart';
import 'package:chateo/src/app/chateo_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './src/app/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ChateoApp());
}
