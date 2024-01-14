import 'package:chateo/src/app/di/di.dart';
import 'package:chateo/src/app/navigator/app_navigator.dart';
import 'package:chateo/src/packages/features/chat_detail/chat_detail.dart';
import 'package:chateo/src/packages/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (context) => BlocProvider(
            create: (context) => sl<HomeBloc>(),
            child: const HomePage(),
          ),
        );
      case AppNavigator.ROUTE_CHAT:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChatDetailPage(
            userChatUid: args![AppNavigator.ARGS_USER_CHAT_ID],
            userChatName: args[AppNavigator.ARGS_USER_CHAT_NAME],
            userChatStatus: args[AppNavigator.ARGS_USER_CHAT_STATUS],
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
