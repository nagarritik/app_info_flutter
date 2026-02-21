import 'app_info_flutter_platform_interface.dart';

class AppInfoFlutter {
  Future<String?> getAppName() {
    return AppInfoFlutterPlatform.instance.getAppName();
  }

  Future<String?> getPackageName() {
    return AppInfoFlutterPlatform.instance.getPackageName();
  }

  Future<String?> getVersion() {
    return AppInfoFlutterPlatform.instance.getVersion();
  }

  Future<String?> getBuildNumber() {
    return AppInfoFlutterPlatform.instance.getBuildNumber();
  }
}
