import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  Light,
  // ignore: constant_identifier_names
  Dark,
}

class AppThemeData {
  AppThemeData._();

  static final appThemeData = {
    AppTheme.Light: _lightThemeData,
    AppTheme.Dark: _darkThemeData,
  };

  static final ThemeData _base = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleTextStyle: textStyleAppBar,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: textStyleLabel.copyWith(
          color: AppColors.primaryOrange,
          fontSize: 12,
          fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          textStyleLabel.copyWith(color: Colors.blueGrey, fontSize: 10),
      selectedItemColor: AppColors.primaryOrange,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData get _lightThemeData {
    final baseLight = ThemeData.light();
    return baseLight.copyWith(
      colorScheme: baseLight.colorScheme.copyWith(
        primary: AppColors.primaryOrange,
      ),
      scaffoldBackgroundColor: AppColors.platinum,
      canvasColor: Colors.white,
      primaryColor: AppColors.primaryOrange,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      appBarTheme: _base.appBarTheme.copyWith(
        titleTextStyle: textStyleAppBar.copyWith(
          color: AppColors.black,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
      ),
      bottomNavigationBarTheme: _base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get _darkThemeData {
    final baseDark = ThemeData.dark();
    return baseDark.copyWith(
      primaryColor: AppColors.primaryOrange,
      secondaryHeaderColor: AppColors.primaryOrange,
      colorScheme: baseDark.colorScheme.copyWith(
        primary: AppColors.primaryOrange,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      scaffoldBackgroundColor: const Color(0xFF1E1F20),
      cardColor: const Color(0xff2E2F33),
      appBarTheme: _base.appBarTheme.copyWith(
        titleTextStyle: textStyleAppBar.copyWith(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: _base.bottomNavigationBarTheme.copyWith(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        unselectedLabelStyle:
            textStyleLabel.copyWith(color: Colors.white, fontSize: 10),
        unselectedItemColor: Colors.white,
      ),
    );
  }

  static ThemeData fromEnum(AppTheme theme) =>
      appThemeData[theme] ?? _lightThemeData;

  static ThemeData byIndex(int index) => appThemeData.values.toList()[index];
}
