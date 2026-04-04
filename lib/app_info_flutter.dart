/// A Flutter plugin package to retrieve basic app information.
///
/// This package provides methods to retrieve the application name,
/// package name, version, build number, and other app metadata.
library;

import 'dart:typed_data';

import 'app_info_flutter_platform_interface.dart';

/// Enum representing the build type of the application.
enum BuildType {
  /// Debug build
  debug,

  /// Release build
  release,

  /// Profile build
  profile,
}

/// The main class that provides access to the app information APIs.
class AppInfoFlutter {
  /// Creates a new instance of [AppInfoFlutter].
  AppInfoFlutter();

  /// Returns the application name.
  ///
  /// This is the name displayed to the user on their device.
  Future<String?> getAppName() {
    return AppInfoFlutterPlatform.instance.getAppName();
  }

  /// Returns the package name (Android) or bundle identifier (iOS).
  Future<String?> getPackageName() {
    return AppInfoFlutterPlatform.instance.getPackageName();
  }

  /// Returns the version of the application.
  ///
  /// This typically corresponds to the `versionName` on Android
  /// or `CFBundleShortVersionString` on iOS.
  Future<String?> getVersion() {
    return AppInfoFlutterPlatform.instance.getVersion();
  }

  /// Returns the build number of the application.
  ///
  /// This typically corresponds to the `versionCode` on Android
  /// or `CFBundleVersion` on iOS.
  Future<String?> getBuildNumber() {
    return AppInfoFlutterPlatform.instance.getBuildNumber();
  }

  /// Returns the first install time (Android only).
  Future<DateTime?> getFirstInstallTime() {
    return AppInfoFlutterPlatform.instance.getFirstInstallTime();
  }

  /// Returns the last update time (Android only).
  Future<DateTime?> getLastUpdateTime() {
    return AppInfoFlutterPlatform.instance.getLastUpdateTime();
  }

  /// Returns the build type (Android only).
  Future<BuildType?> getBuildType() {
    return AppInfoFlutterPlatform.instance.getBuildType();
  }

  /// Returns the installer package name (e.g., com.android.vending for Play Store) (Android only).
  Future<String?> getInstallerPackageName() {
    return AppInfoFlutterPlatform.instance.getInstallerPackageName();
  }

  /// Returns the app icon as bytes (Android only).
  Future<Uint8List?> getAppIcon() {
    return AppInfoFlutterPlatform.instance.getAppIcon();
  }

  /// Returns the total installed app size in bytes (Android only).
  Future<int?> getAppSize() {
    return AppInfoFlutterPlatform.instance.getAppSize();
  }

  /// Returns the cache size in bytes (Android only).
  Future<int?> getCacheSize() {
    return AppInfoFlutterPlatform.instance.getCacheSize();
  }

  /// Returns the target SDK version (Android only).
  Future<int?> getTargetSdkVersion() {
    return AppInfoFlutterPlatform.instance.getTargetSdkVersion();
  }

  /// Returns the minimum SDK version (Android only).
  Future<int?> getMinSdkVersion() {
    return AppInfoFlutterPlatform.instance.getMinSdkVersion();
  }

  /// Returns a list of granted permissions (Android only).
  Future<List<String>?> getGrantedPermissions() {
    return AppInfoFlutterPlatform.instance.getGrantedPermissions();
  }

  /// Returns a list of declared permissions (Android only).
  Future<List<String>?> getDeclaredPermissions() {
    return AppInfoFlutterPlatform.instance.getDeclaredPermissions();
  }
}
