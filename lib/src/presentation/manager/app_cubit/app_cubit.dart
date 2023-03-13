import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/app_config/language.dart';
import 'package:weather_app/src/domain/repositories/app_repository.dart';
import 'package:weather_app/src/presentation/app/theme/theming.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this._appPreferencesRepository,
  ) : super(AppState.initial(_appPreferencesRepository)) {
    getInternetConnectionStatus();
  }

  final AppRepository _appPreferencesRepository;

  void toggleTheme() {
    if (state.themeData?.brightness == Brightness.light) {
      _appPreferencesRepository.setThemeData(AppTheme.Dark);
      emit(state.copyWith(themeData: AppThemeData.appThemeData[AppTheme.Dark]));
    } else {
      _appPreferencesRepository.setThemeData(AppTheme.Light);
      emit(
          state.copyWith(themeData: AppThemeData.appThemeData[AppTheme.Light]));
    }
  }

  ///Only for development options
  void toggleDevicePreviewFrame() {
    if (_appPreferencesRepository.showDevicePreviewFrame) {
      _appPreferencesRepository.setShowDevicePreviewFrame(false);
      emit(state.copyWith(devicePreviewFrame: false));
    } else {
      _appPreferencesRepository.setShowDevicePreviewFrame(true);
      emit(state.copyWith(devicePreviewFrame: true));
    }
  }

  void changeLanguage(Language language) {
    emit(state.copyWith(locale: language.locale));
    _appPreferencesRepository.setLanguage(language);
  }

  void changeFontSize(double fontSize) {
    emit(state.copyWith(fontSize: fontSize));
    _appPreferencesRepository.setFontSize(fontSize);
  }

  Future<void> getInternetConnectionStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(state.copyWith(thereIsConnection: true));
    } else {
      emit(state.copyWith(thereIsConnection: false));
    }
  }

  void changeInternetConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(state.copyWith(thereIsConnection: true));
    } else {
      emit(state.copyWith(thereIsConnection: false));
    }
  }
}
