import 'package:flutter/material.dart';
import 'package:weather_app/src/core/app_config/language.dart';
import 'package:weather_app/src/presentation/app/theme/theming.dart';

abstract class AppRepository {
  ThemeData get currentTheme;

  void setThemeData(AppTheme theme);

  Language get currentLanguage;

  void setLanguage(Language language);

  double get currentFontSize;

  void setFontSize(double fontSized);

  bool get showDevicePreviewFrame;

  void setShowDevicePreviewFrame(bool show);
}
