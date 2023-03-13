import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/core/dio/dio_client.dart';
import 'package:weather_app/src/core/services_manager/logger_service.dart';
import 'package:weather_app/src/core/services_manager/package_info_service.dart';
import 'package:weather_app/src/core/services_manager/url_launcher_service.dart';
import 'package:weather_app/src/core/utils/env_config.dart';
import 'package:weather_app/src/data/data_sources/remote/remote_datasource.dart';
import 'package:weather_app/src/data/repositories/app_repository_impl.dart';
import 'package:weather_app/src/data/repositories/remote_repository_impl.dart';
import 'package:weather_app/src/domain/repositories/app_repository.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies(String environment) async {
  await registerStorageDirectory();

  //**
  // - I register the instance like registerLazySingleton() because i need that the
  // instance register the first time that in call them.
  // - If i register the instance like registerSingleton() the instance will be created at the first time that app start
  //**/

  // Environment
  GetIt.I.registerLazySingleton(
    () => EnvironmentInfo.fromEnvironment(environment),
  );
  //

  // SharedPreferences
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);
  //

  injector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(injector()),
  );

  // Dio client
  injector.registerLazySingleton<Dio>(() => Dio());

  injector.registerSingleton<DioHttpClient>(
    DioHttpClientImpl(
      injector(),
      injector(),  
    ),
  );
  //

  // DataSources
  injector.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(injector()),
  );

  // Repositories

  injector.registerLazySingleton<RemoteRepository>(
    () => RemoteRepositoryImpl(injector(), injector()),
  );

  //

  //Services manager
  injector.registerLazySingleton<UrlLauncherService>(
    () => UrlLauncherServiceImpl(),
  );

  final packageInfo = await PackageInfo.fromPlatform();
  injector.registerLazySingleton(() => packageInfo);
  injector.registerLazySingleton<PackageInfoService>(
    () => PackageInfoServiceImpl(injector()),
  );

  injector.registerLazySingleton<LoggerService>(() => LoggerServiceImpl());
  //

  // UseCases
  // injector.registerLazySingleton<InsertNewNormsIntoDBUseCase>(
  //   () => InsertNewNormsIntoDBUseCase(injector(), injector()),
  // );

  // Blocs/Cubits
  //**
  // They are register like registerFactory because every time i need a new instance of the BloC/Cubit
  //**
  // injector.registerFactory<AppCubit>(() => AppCubit(injector()));
}

Future<void> registerStorageDirectory() async {
  if (kIsWeb) {
    final webStorageDirectory = Directory('');
    injector.registerLazySingleton(() => webStorageDirectory);
  } else if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      injector.registerLazySingleton(() => dir);
    }
  } else if (Platform.isIOS) {
    final Directory dir = await getApplicationDocumentsDirectory();
    injector.registerLazySingleton(() => dir);
  }
}
