import 'package:flutter_test/flutter_test.dart';
import 'package:app_info_flutter/app_info_flutter.dart';
import 'package:app_info_flutter/app_info_flutter_platform_interface.dart';
import 'package:app_info_flutter/app_info_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'dart:typed_data';

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

  @override
  Future<DateTime?> getFirstInstallTime() =>
      Future.value(DateTime.fromMillisecondsSinceEpoch(1609459200000));

  @override
  Future<DateTime?> getLastUpdateTime() =>
      Future.value(DateTime.fromMillisecondsSinceEpoch(1640995200000));

  @override
  Future<BuildType?> getBuildType() => Future.value(BuildType.release);

  @override
  Future<String?> getInstallerPackageName() =>
      Future.value('com.android.vending');

  @override
  Future<Uint8List?> getAppIcon() =>
      Future.value(Uint8List.fromList([137, 80, 78, 71]));

  @override
  Future<int?> getAppSize() => Future.value(52428800);

  @override
  Future<int?> getCacheSize() => Future.value(10485760);

  @override
  Future<int?> getTargetSdkVersion() => Future.value(33);

  @override
  Future<int?> getMinSdkVersion() => Future.value(21);

  @override
  Future<List<String>?> getGrantedPermissions() =>
      Future.value(['android.permission.INTERNET']);

  @override
  Future<List<String>?> getDeclaredPermissions() => Future.value([
    'android.permission.INTERNET',
    'android.permission.ACCESS_FINE_LOCATION',
  ]);
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
