import 'package:flutter_test/flutter_test.dart';
import 'package:app_info_flutter/app_info_flutter.dart';
import 'package:app_info_flutter/app_info_flutter_platform_interface.dart';
import 'package:app_info_flutter/app_info_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppInfoFlutterPlatform
    with MockPlatformInterfaceMixin
    implements AppInfoFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppInfoFlutterPlatform initialPlatform = AppInfoFlutterPlatform.instance;

  test('$MethodChannelAppInfoFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppInfoFlutter>());
  });

  test('getPlatformVersion', () async {
    AppInfoFlutter appInfoFlutterPlugin = AppInfoFlutter();
    MockAppInfoFlutterPlatform fakePlatform = MockAppInfoFlutterPlatform();
    AppInfoFlutterPlatform.instance = fakePlatform;

    expect(await appInfoFlutterPlugin.getPlatformVersion(), '42');
  });
}
