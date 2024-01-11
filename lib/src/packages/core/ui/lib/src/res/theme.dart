import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ChateoThemes {
  ChateoThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: ChateoColors.primary,
  );

  static final TextTheme _textTheme = TextTheme(
      displayLarge: const TextStyle(
        fontSize: 70,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
          fontSize: 18,
          color: ChateoColors.black,
          fontWeight: FontWeight.bold));

  static final _dividerThemeData = DividerThemeData(
    color: ChateoColors.lightGrey.withOpacity(0.4),
  );

  static final _elevatedButtonTheme = ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: _colorSchemeLight.primary,
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ChateoDimens.dimen_12), // <-- Radius
    ),
    padding: const EdgeInsets.symmetric(
      vertical: ChateoDimens.dimen_16,
      horizontal: ChateoDimens.dimen_32,
    ),
  );

  static final _elevatedButtonThemeData = ElevatedButtonThemeData(
    style: _elevatedButtonTheme,
  );

  static final _appBarTheme = AppBarTheme(
      iconTheme: IconThemeData(
    color: ChateoColors.black,
  ));

  static final _inputDecorationTheme = InputDecorationTheme(
    labelStyle: TextStyle(
      color: _colorSchemeLight.primary,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _colorSchemeLight.primary,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _colorSchemeLight.primary,
      ),
    ),
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
      textTheme: _textTheme,
    ).copyWith(
        dividerTheme: _dividerThemeData,
        elevatedButtonTheme: _elevatedButtonThemeData,
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputDecorationTheme);
  }
}
