import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_info_flutter_platform_interface.dart';

/// An implementation of [AppInfoFlutterPlatform] that uses method channels.
class MethodChannelAppInfoFlutter extends AppInfoFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_info_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
