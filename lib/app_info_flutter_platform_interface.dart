import 'package:plugin_platform_interface/plugin_platform_interface.dart';

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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
