import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

import 'app_info_flutter.dart';
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

  /// Returns the first install time.
  @override
  Future<DateTime?> getFirstInstallTime() async {
    final firstInstallTime = await methodChannel.invokeMethod<int>(
      'getFirstInstallTime',
    );
    return firstInstallTime != null
        ? DateTime.fromMillisecondsSinceEpoch(firstInstallTime)
        : null;
  }

  /// Returns the last update time.
  @override
  Future<DateTime?> getLastUpdateTime() async {
    final lastUpdateTime = await methodChannel.invokeMethod<int>(
      'getLastUpdateTime',
    );
    return lastUpdateTime != null
        ? DateTime.fromMillisecondsSinceEpoch(lastUpdateTime)
        : null;
  }

  /// Returns the build type.
  @override
  Future<BuildType?> getBuildType() async {
    final buildType = await methodChannel.invokeMethod<String>('getBuildType');
    if (buildType == null) return null;
    return BuildType.values.firstWhere(
      (e) => e.name == buildType,
      orElse: () => BuildType.release,
    );
  }

  /// Returns the installer package name.
  @override
  Future<String?> getInstallerPackageName() async {
    final installerPackage = await methodChannel.invokeMethod<String>(
      'getInstallerPackageName',
    );
    return installerPackage;
  }

  /// Returns the app icon as bytes.
  @override
  Future<Uint8List?> getAppIcon() async {
    final iconBytes = await methodChannel.invokeMethod<Uint8List>('getAppIcon');
    return iconBytes;
  }

  /// Returns the total installed app size in bytes.
  @override
  Future<int?> getAppSize() async {
    final appSize = await methodChannel.invokeMethod<int>('getAppSize');
    return appSize;
  }

  /// Returns the cache size in bytes.
  @override
  Future<int?> getCacheSize() async {
    final cacheSize = await methodChannel.invokeMethod<int>('getCacheSize');
    return cacheSize;
  }

  /// Returns the target SDK version.
  @override
  Future<int?> getTargetSdkVersion() async {
    final targetSdkVersion = await methodChannel.invokeMethod<int>(
      'getTargetSdkVersion',
    );
    return targetSdkVersion;
  }

  /// Returns the minimum SDK version.
  @override
  Future<int?> getMinSdkVersion() async {
    final minSdkVersion = await methodChannel.invokeMethod<int>(
      'getMinSdkVersion',
    );
    return minSdkVersion;
  }

  /// Returns a list of granted permissions.
  @override
  Future<List<String>?> getGrantedPermissions() async {
    final grantedPermissions = await methodChannel.invokeMethod<List<Object?>>(
      'getGrantedPermissions',
    );
    return grantedPermissions?.cast<String>();
  }

  /// Returns a list of declared permissions.
  @override
  Future<List<String>?> getDeclaredPermissions() async {
    final declaredPermissions = await methodChannel.invokeMethod<List<Object?>>(
      'getDeclaredPermissions',
    );
    return declaredPermissions?.cast<String>();
  }
}
