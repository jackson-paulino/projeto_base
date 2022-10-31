import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  ThemeData get defaultTheme => ThemeData(
        fontFamily: 'Open-sans',
        primaryColor: AppColors.primary,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          height: 50,
          buttonColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            backgroundColor: Colors.transparent,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30)),
        ),
      );
}
