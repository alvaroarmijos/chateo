import 'package:chateo/src/app/chateo_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './src/app/di/di.dart' as di;
import 'firebase_options.dart';
import 'src/app/notification/notification_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.sl<NotificationSetup>().setupFlutterNotifications();

  runApp(const ChateoApp());
}
