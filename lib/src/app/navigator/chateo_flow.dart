import 'package:chateo/src/app/navigator/app_navigator.dart';
import 'package:chateo/src/packages/features/home/home.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class ChateoFlow extends StatelessWidget {
  const ChateoFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: _routeFactory,
    );
  }

  static Route<dynamic> _routeFactory(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case AppNavigator.ROUTE_MAIN_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
          // builder: (context) => BlocProvider(
          //   create: (context) => sl<HomeBloc>(),
          //   child: const HomePage(),
          // ),
        );
      // case AppNavigator.ROUTE_CHAT:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) => BlocProvider(
      //       create: (context) => sl<ChatBloc>(),
      //       child: ChatDetailPage(
      //         userChatUid: args![AppNavigator.ARGS_USER_CHAT_ID],
      //         userChatName: args[AppNavigator.ARGS_USER_CHAT_NAME],
      //         userChatStatus: args[AppNavigator.ARGS_USER_CHAT_STATUS],
      //         userChatPhotoUrl: args[AppNavigator.ARGS_USER_PHOTO_URL],
      //         myUid: args[AppNavigator.ARGS_MY_UID],
      //       ),
      //     ),
      //   );
      // case AppNavigator.ROUTE_PROFILE:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) => BlocProvider(
      //       create: (context) => sl<ProfileBloc>(),
      //       child: const ProfilePage(),
      //     ),
      //   );
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
