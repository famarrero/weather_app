import 'package:package_info_plus/package_info_plus.dart';

abstract class PackageInfoService {
  String getAppName();

  String getAppPackageName();

  String getAppVersion();

  String getAppBuildNumber();
}

class PackageInfoServiceImpl implements PackageInfoService {
  const PackageInfoServiceImpl(this._packageInfo);

  final PackageInfo _packageInfo;

  @override
  String getAppBuildNumber() {
    return _packageInfo.buildNumber;
  }

  @override
  String getAppName() {
    return _packageInfo.appName;
  }

  @override
  String getAppPackageName() {
    return _packageInfo.packageName;
  }

  @override
  String getAppVersion() {
    return _packageInfo.version;
  }
}
