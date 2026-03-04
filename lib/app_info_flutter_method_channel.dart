import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_info_flutter_platform_interface.dart';

/// An implementation of [AppInfoFlutterPlatform] that uses method channels.
class MethodChannelAppInfoFlutter extends AppInfoFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_info_flutter');

  /// Returns the application name using the platform channel.
  @override
  Future<String?> getAppName() async {
    final appName = await methodChannel.invokeMethod<String>('getAppName');
    return appName;
  }

  /// Returns the package name or bundle identifier using the platform channel.
  @override
  Future<String?> getPackageName() async {
    final packageName = await methodChannel.invokeMethod<String>(
      'getPackageName',
    );
    return packageName;
  }

  /// Returns the version string using the platform channel.
  @override
  Future<String?> getVersion() async {
    final version = await methodChannel.invokeMethod<String>('getVersion');
    return version;
  }

  /// Returns the build number using the platform channel.
  @override
  Future<String?> getBuildNumber() async {
    final buildNumber = await methodChannel.invokeMethod<String>(
      'getBuildNumber',
    );
    return buildNumber;
  }
}
