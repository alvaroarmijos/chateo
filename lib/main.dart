import 'package:chateo/firebase_options.dart';
import 'package:chateo/src/app/notifications/notifications_setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './src/app/di/di.dart' as di;
import 'src/app/chateo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  await di.sl<NotificationSetup>().setupFlutterNotifications();

  runApp(const ChateoApp());
}
