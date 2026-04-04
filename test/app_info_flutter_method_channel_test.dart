import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_info_flutter/app_info_flutter.dart';
import 'package:app_info_flutter/app_info_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAppInfoFlutter platform = MethodChannelAppInfoFlutter();
  const MethodChannel channel = MethodChannel('app_info_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          switch (methodCall.method) {
            case 'getAppName':
              return 'AppInfo';
            case 'getPackageName':
              return 'com.example.app';
            case 'getVersion':
              return '1.0.0';
            case 'getBuildNumber':
              return '1';
            case 'getFirstInstallTime':
              return 1609459200000;
            case 'getLastUpdateTime':
              return 1640995200000;
            case 'getBuildType':
              return 'release';
            case 'getInstallerPackageName':
              return 'com.android.vending';
            case 'getAppIcon':
              return null;
            case 'getAppSize':
              return 52428800;
            case 'getCacheSize':
              return 10485760;
            case 'getTargetSdkVersion':
              return 33;
            case 'getMinSdkVersion':
              return 21;
            case 'getGrantedPermissions':
              return ['android.permission.INTERNET'];
            case 'getDeclaredPermissions':
              return [
                'android.permission.INTERNET',
                'android.permission.ACCESS_FINE_LOCATION',
              ];
            default:
              return null;
          }
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getAppName', () async {
    expect(await platform.getAppName(), 'AppInfo');
  });

  test('getPackageName', () async {
    expect(await platform.getPackageName(), 'com.example.app');
  });

  test('getVersion', () async {
    expect(await platform.getVersion(), '1.0.0');
  });

  test('getBuildNumber', () async {
    expect(await platform.getBuildNumber(), '1');
  });

  test('getFirstInstallTime', () async {
    expect(
      await platform.getFirstInstallTime(),
      DateTime.fromMillisecondsSinceEpoch(1609459200000),
    );
  });

  test('getLastUpdateTime', () async {
    expect(
      await platform.getLastUpdateTime(),
      DateTime.fromMillisecondsSinceEpoch(1640995200000),
    );
  });

  test('getBuildType', () async {
    expect(await platform.getBuildType(), BuildType.release);
  });

  test('getInstallerPackageName', () async {
    expect(await platform.getInstallerPackageName(), 'com.android.vending');
  });

  test('getAppSize', () async {
    expect(await platform.getAppSize(), 52428800);
  });

  test('getCacheSize', () async {
    expect(await platform.getCacheSize(), 10485760);
  });

  test('getTargetSdkVersion', () async {
    expect(await platform.getTargetSdkVersion(), 33);
  });

  test('getMinSdkVersion', () async {
    expect(await platform.getMinSdkVersion(), 21);
  });

  test('getGrantedPermissions', () async {
    expect(await platform.getGrantedPermissions(), [
      'android.permission.INTERNET',
    ]);
  });

  test('getDeclaredPermissions', () async {
    expect(await platform.getDeclaredPermissions(), [
      'android.permission.INTERNET',
      'android.permission.ACCESS_FINE_LOCATION',
    ]);
  });
}
