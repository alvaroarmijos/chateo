// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_LOG_IN = '/log-in';
  static const ROUTE_SIGN_UP = '/sign-up';
  static const ROUTE_CHAT = '/chat';

  static const ARGS_USER_CHAT_ID = 'userChatId';
  static const ARGS_USER_CHAT_NAME = 'userChatName';
  static const ARGS_USER_CHAT_STATUS = 'userChatStatus';
  static const ARGS_USER_PHOTO_URL = 'userChatPhotoUrl';

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

  static void navigateToChat(
    BuildContext context,
    String userChatUid,
    String userChatName,
    String? userPhotoUrl,
    bool userChatStatus,
  ) {
    Navigator.pushNamed(
      context,
      ROUTE_CHAT,
      arguments: <String, dynamic>{
        ARGS_USER_CHAT_ID: userChatUid,
        ARGS_USER_CHAT_NAME: userChatName,
        ARGS_USER_CHAT_STATUS: userChatStatus,
        ARGS_USER_PHOTO_URL: userPhotoUrl,
      },
    );
  }
}
