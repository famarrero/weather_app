import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/services_manager/logger_service.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/manager/app_cubit/app_cubit.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _InitWidgetState createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();

    //Check internet connection
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      context.read<AppCubit>().changeInternetConnectionStatus(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
