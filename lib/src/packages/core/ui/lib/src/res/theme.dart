import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ChateoThemes {
  ChateoThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: ChateoColors.primary,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 70,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );

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

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
      textTheme: _textTheme,
    ).copyWith(
      dividerTheme: _dividerThemeData,
      elevatedButtonTheme: _elevatedButtonThemeData,
    );
  }
}
