part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    required this.locale,
    this.themeData,
    required this.fontSize,
    required this.devicePreviewFrame,
    required this.thereIsConnection,
  });

  factory AppState.initial(AppRepository appPreferencesRepository) {
    final language = appPreferencesRepository.currentLanguage;
    final savedTheme = appPreferencesRepository.currentTheme;
    final savedFontSize = appPreferencesRepository.currentFontSize;
    final savedDevicePreviewFrame = appPreferencesRepository.showDevicePreviewFrame;

    return AppState(
      locale: language.locale,
      themeData: savedTheme,
      fontSize: savedFontSize,
      devicePreviewFrame: savedDevicePreviewFrame,
      thereIsConnection: true,
    );
  }

  //Set the language of the app
  final Locale? locale;
  final ThemeData? themeData;
  final double fontSize;
  final bool devicePreviewFrame;
  final bool thereIsConnection;

  @override
  List<Object?> get props => [locale, themeData, fontSize, devicePreviewFrame, thereIsConnection];

  AppState copyWith({
    Locale? locale,
    ThemeData? themeData,
    double? fontSize,
    bool? devicePreviewFrame,
    bool? thereIsConnection,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      themeData: themeData ?? this.themeData,
      fontSize: fontSize ?? this.fontSize,
      devicePreviewFrame: devicePreviewFrame ?? this.devicePreviewFrame,
      thereIsConnection: thereIsConnection ?? this.thereIsConnection,
    );
  }
}
