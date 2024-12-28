import 'package:flutter/material.dart';
import 'package:practice_clean_architecture/config/theme/color_pallet.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      );
  static final darktheme = ThemeData.dark().copyWith(
      appBarTheme:
          const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: _border(AppPallete.gradient2),
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: _border()));
}
