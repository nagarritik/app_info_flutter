
import 'app_info_flutter_platform_interface.dart';

class AppInfoFlutter {
  Future<String?> getPlatformVersion() {
    return AppInfoFlutterPlatform.instance.getPlatformVersion();
  }
}
