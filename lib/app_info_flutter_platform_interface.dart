import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'dart:typed_data';

import 'app_info_flutter.dart';
import 'app_info_flutter_method_channel.dart';

abstract class AppInfoFlutterPlatform extends PlatformInterface {
  /// Constructs a AppInfoFlutterPlatform.
  AppInfoFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppInfoFlutterPlatform _instance = MethodChannelAppInfoFlutter();

  /// The default instance of [AppInfoFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppInfoFlutter].
  static AppInfoFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppInfoFlutterPlatform] when
  /// they register themselves.
  static set instance(AppInfoFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the application name.
  Future<String?> getAppName() {
    throw UnimplementedError('getAppName() has not been implemented.');
  }

  /// Returns the package name (Android) or bundle identifier (iOS).
  Future<String?> getPackageName() {
    throw UnimplementedError('getPackageName() has not been implemented.');
  }

  /// Returns the version of the application.
  Future<String?> getVersion() {
    throw UnimplementedError('getVersion() has not been implemented.');
  }

  /// Returns the build number of the application.
  Future<String?> getBuildNumber() {
    throw UnimplementedError('getBuildNumber() has not been implemented.');
  }

  /// Returns the first install time (Android only).
  Future<DateTime?> getFirstInstallTime() {
    throw UnimplementedError('getFirstInstallTime() has not been implemented.');
  }

  /// Returns the last update time (Android only).
  Future<DateTime?> getLastUpdateTime() {
    throw UnimplementedError('getLastUpdateTime() has not been implemented.');
  }

  /// Returns the build type (Android only).
  Future<BuildType?> getBuildType() {
    throw UnimplementedError('getBuildType() has not been implemented.');
  }

  /// Returns the installer package name (e.g., com.android.vending for Play Store) (Android only).
  Future<String?> getInstallerPackageName() {
    throw UnimplementedError(
      'getInstallerPackageName() has not been implemented.',
    );
  }

  /// Returns the app icon as bytes (Android only).
  Future<Uint8List?> getAppIcon() {
    throw UnimplementedError('getAppIcon() has not been implemented.');
  }

  /// Returns the total installed app size in bytes (Android only).
  Future<int?> getAppSize() {
    throw UnimplementedError('getAppSize() has not been implemented.');
  }

  /// Returns the cache size in bytes (Android only).
  Future<int?> getCacheSize() {
    throw UnimplementedError('getCacheSize() has not been implemented.');
  }

  /// Returns the target SDK version (Android only).
  Future<int?> getTargetSdkVersion() {
    throw UnimplementedError('getTargetSdkVersion() has not been implemented.');
  }

  /// Returns the minimum SDK version (Android only).
  Future<int?> getMinSdkVersion() {
    throw UnimplementedError('getMinSdkVersion() has not been implemented.');
  }

  /// Returns a list of granted permissions (Android only).
  Future<List<String>?> getGrantedPermissions() {
    throw UnimplementedError(
      'getGrantedPermissions() has not been implemented.',
    );
  }

  /// Returns a list of declared permissions (Android only).
  Future<List<String>?> getDeclaredPermissions() {
    throw UnimplementedError(
      'getDeclaredPermissions() has not been implemented.',
    );
  }
}
