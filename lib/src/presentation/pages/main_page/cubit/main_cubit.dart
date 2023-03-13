import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void openMobilDrawable() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
      emit(state.copyWith(isDrawerOpen: true));
    }
  }

  void closeMobileDrawable() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
      emit(state.copyWith(isDrawerOpen: false));
    }
  }
}
