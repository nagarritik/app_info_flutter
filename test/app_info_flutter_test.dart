import 'package:flutter_test/flutter_test.dart';
import 'package:app_info_flutter/app_info_flutter.dart';
import 'package:app_info_flutter/app_info_flutter_platform_interface.dart';
import 'package:app_info_flutter/app_info_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppInfoFlutterPlatform
    with MockPlatformInterfaceMixin
    implements AppInfoFlutterPlatform {
  @override
  Future<String?> getAppName() => Future.value('AppInfo');

  @override
  Future<String?> getPackageName() => Future.value('com.example.app');

  @override
  Future<String?> getVersion() => Future.value('1.0.0');

  @override
  Future<String?> getBuildNumber() => Future.value('1');
}

void main() {
  final AppInfoFlutterPlatform initialPlatform =
      AppInfoFlutterPlatform.instance;

  test('$MethodChannelAppInfoFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppInfoFlutter>());
  });

  test('getAppName', () async {
    AppInfoFlutter appInfoFlutterPlugin = AppInfoFlutter();
    MockAppInfoFlutterPlatform fakePlatform = MockAppInfoFlutterPlatform();
    AppInfoFlutterPlatform.instance = fakePlatform;

    expect(await appInfoFlutterPlugin.getAppName(), 'AppInfo');
  });

  test('getPackageName', () async {
    AppInfoFlutter appInfoFlutterPlugin = AppInfoFlutter();
    MockAppInfoFlutterPlatform fakePlatform = MockAppInfoFlutterPlatform();
    AppInfoFlutterPlatform.instance = fakePlatform;

    expect(await appInfoFlutterPlugin.getPackageName(), 'com.example.app');
  });

  test('getVersion', () async {
    AppInfoFlutter appInfoFlutterPlugin = AppInfoFlutter();
    MockAppInfoFlutterPlatform fakePlatform = MockAppInfoFlutterPlatform();
    AppInfoFlutterPlatform.instance = fakePlatform;

    expect(await appInfoFlutterPlugin.getVersion(), '1.0.0');
  });

  test('getBuildNumber', () async {
    AppInfoFlutter appInfoFlutterPlugin = AppInfoFlutter();
    MockAppInfoFlutterPlatform fakePlatform = MockAppInfoFlutterPlatform();
    AppInfoFlutterPlatform.instance = fakePlatform;

    expect(await appInfoFlutterPlugin.getBuildNumber(), '1');
  });
}
