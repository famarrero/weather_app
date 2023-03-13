import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sizer/sizer.dart' as sizer;
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/manager/app_cubit/app_cubit.dart';
import 'package:weather_app/src/presentation/pages/init_widget.dart';
import 'package:weather_app/src/routes/routes.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const environment = String.fromEnvironment('env', defaultValue: 'dev');
  await initializeDependencies(environment);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return sizer.Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        sizer.DeviceType deviceType,
      ) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit(injector())),           
          ],
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, appState) {
              return InitWidget(
                child: DevicePreview(
                  enabled: appState.devicePreviewFrame,
                  builder: (context) => OKToast(
                    child: MaterialApp.router(
                      routeInformationParser: _appRouter.defaultRouteParser(),
                      routerDelegate: _appRouter.delegate(),                    
                      title: 'WeatherApp',
                      theme: appState.themeData,
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        // Built-in localization for text direction LTR/RTL
                        // GlobalWidgetsLocalizations.delegate,
                      ],
                      locale: appState.locale,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
