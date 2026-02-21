import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
