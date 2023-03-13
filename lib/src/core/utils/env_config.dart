import 'package:weather_app/src/core/dio/dio_client.dart';

//Build app to production mode
// flutter build apk --flavor prod --dart-define=env=prod

//Build app to production mode but in debug mode
// flutter build apk --flavor prod --dart-define=env=prod --debug

enum BuildMode {
  DEBUG,
  RELEASE,
}

abstract class Environment {
  const Environment._();

  static const dev = 'dev';
  static const prod = 'prod';

  static BuildMode currentBuildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.RELEASE;
    }
    var result = BuildMode.DEBUG;
    //Little trick, since assert only runs on DEBUG mode
    assert(() {
      result = BuildMode.DEBUG;
      return true;
    }());
    return result;
  }

  static bool isDebug() {
    return currentBuildMode() == BuildMode.DEBUG;
  }

  static bool isRelease() {
    return currentBuildMode() == BuildMode.RELEASE;
  }
}

class EnvironmentInfo {
  const EnvironmentInfo({
    required this.environment,
    required this.apiBaseUrl,
    required this.logNetworkInfo,
  });

  factory EnvironmentInfo.fromEnvironment(String env) {
    if (env == Environment.prod) {
      return const EnvironmentInfo(
        apiBaseUrl: BASE_URL_PROD,
        logNetworkInfo: false,
        environment: Environment.prod,
      );
    } else {
      //DEV
      return const EnvironmentInfo(
        apiBaseUrl: BASE_URL_DEV,
        logNetworkInfo: true,
        environment: Environment.dev,
      );
    }
  }
  final String apiBaseUrl;
  final bool logNetworkInfo;
  final String environment;
}
