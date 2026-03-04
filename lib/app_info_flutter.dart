/// A Flutter plugin package to retrieve basic app information.
///
/// This package provides methods to retrieve the application name,
/// package name, version, and build number.
library;

import 'app_info_flutter_platform_interface.dart';

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
}
