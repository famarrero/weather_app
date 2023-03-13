import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/core/app_config/language.dart';
import 'package:weather_app/src/domain/repositories/app_repository.dart';
import 'package:weather_app/src/presentation/app/theme/theming.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _keyLocale = 'app_preferences_locale';
  static const _keyTheme = 'app_preferences_theme';
  static const _keyFontSized = 'app_preferences_font_size';
  static const _keyShowDevicePreviewFrame =
      'app_preferences_device_preview_frame';

  @override
  Language get currentLanguage {
    // String? srtLanguage = await _cacheStorage.read<String>(keyLocale);
    final String? srtLanguage = _sharedPreferences.getString(_keyLocale);

    if (srtLanguage != null) {
      return Language.values.firstWhere(
        (element) => element.toString() == 'Language.$srtLanguage',
      );
    } else {
      return Language.es;
    }
  }

  @override
  void setLanguage(Language language) {
    _sharedPreferences.setString(_keyLocale, describeEnum(language));
  }

  @override
  void setThemeData(AppTheme theme) {
    _sharedPreferences.setInt(_keyTheme, AppTheme.values.indexOf(theme));
  }

  @override
  ThemeData get currentTheme {
    // 0 Light 1 Dark
    final themeIndex = _sharedPreferences.getInt(_keyTheme);
    if (themeIndex != null) {
      return AppThemeData.byIndex(themeIndex);
    } else {
      // If previous theme not found, use Light
      return AppThemeData.fromEnum(AppTheme.Light);
    }
  }

  @override
  double get currentFontSize {
    final double? fontSize = _sharedPreferences.getDouble(_keyFontSized);
    return fontSize ?? 18.0;
  }

  @override
  void setFontSize(double fontSized) {
    _sharedPreferences.setDouble(_keyFontSized, fontSized);
  }

  @override
  void setShowDevicePreviewFrame(bool show) {
    _sharedPreferences.setBool(_keyShowDevicePreviewFrame, show);
  }

  @override
  bool get showDevicePreviewFrame {
    final bool? showDevicePreviewFrame =
        _sharedPreferences.getBool(_keyShowDevicePreviewFrame);
    return showDevicePreviewFrame ?? false;
  }

}
