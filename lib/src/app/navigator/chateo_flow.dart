import 'package:chateo/src/app/di/di.dart';
import 'package:chateo/src/app/navigator/app_navigator.dart';
import 'package:chateo/src/app/notifications/notifications_setup.dart';
import 'package:chateo/src/packages/features/chat_detail/chat_detail.dart';
import 'package:chateo/src/packages/features/home/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../packages/features/profile/profile.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class ChateoFlow extends StatefulWidget {
  const ChateoFlow({super.key});

  @override
  State<ChateoFlow> createState() => _ChateoFlowState();

  static Route<dynamic> _routeFactory(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case AppNavigator.ROUTE_MAIN_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => sl<HomeBloc>(),
            child: const HomePage(),
          ),
        );
      case AppNavigator.ROUTE_CHAT:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => sl<ChatBloc>(),
            child: ChatDetailPage(
              userChatName: args![AppNavigator.ARGS_USER_CHAT_NAME],
              userChatPhotoUrl: args[AppNavigator.ARGS_USER_PHOTO_URL],
              userChatStatus: args[AppNavigator.ARGS_USER_CHAT_STATUS],
              myUid: args[AppNavigator.ARGS_MY_UID],
              chatUserId: args[AppNavigator.ARGS_USER_CHAT_ID],
            ),
          ),
        );
      case AppNavigator.ROUTE_PROFILE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => sl<ProfileBloc>(),
            child: const ProfilePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name} on ChateoFlow',
              ),
            ),
          ),
        );
    }
  }
}

class _ChateoFlowState extends State<ChateoFlow> {
  @override
  void initState() {
    FirebaseMessaging.onMessage
        .listen(sl<NotificationSetup>().showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //TODO: add events
      print('A new oppenApp Event');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: ChateoFlow._routeFactory,
    );
  }
}
