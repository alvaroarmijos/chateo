// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_LOG_IN = '/log-in';
  static const ROUTE_SIGN_UP = '/sign-up';

  static void navigateBack(BuildContext context) => Navigator.pop(context);

  static void navigateToMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, ROUTE_MAIN_PAGE);
  }

  static void navigateBackToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      ROUTE_MAIN_PAGE,
      (route) => false,
    );
  }

  static void navigateToLogIn(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_LOG_IN);
  }

  static void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_SIGN_UP);
  }
}
