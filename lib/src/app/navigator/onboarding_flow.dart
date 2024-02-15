import 'package:chateo/src/app/di/di.dart';
import 'package:chateo/src/app/navigator/app_navigator.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: _routeFactory,
    );
  }

  static Route<dynamic> _routeFactory(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigator.ROUTE_MAIN_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OnboardingPage(),
        );
      case AppNavigator.ROUTE_LOG_IN:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => sl<LoginBloc>(),
            child: const LoginPage(),
          ),
        );
      case AppNavigator.ROUTE_SIGN_UP:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => sl<SignUpBloc>(),
            child: const SignUpPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name} on Onboarding Flow',
              ),
            ),
          ),
        );
    }
  }
}
