// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:app_info_flutter/app_info_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getAppName test', (WidgetTester tester) async {
    final AppInfoFlutter plugin = AppInfoFlutter();
    final String? name = await plugin.getAppName();
    expect(name?.isNotEmpty, true);
  });

  testWidgets('getPackageName test', (WidgetTester tester) async {
    final AppInfoFlutter plugin = AppInfoFlutter();
    final String? packageName = await plugin.getPackageName();
    expect(packageName?.isNotEmpty, true);
  });

  testWidgets('getVersion test', (WidgetTester tester) async {
    final AppInfoFlutter plugin = AppInfoFlutter();
    final String? version = await plugin.getVersion();
    expect(version?.isNotEmpty, true);
  });

  testWidgets('getBuildNumber test', (WidgetTester tester) async {
    final AppInfoFlutter plugin = AppInfoFlutter();
    final String? buildNumber = await plugin.getBuildNumber();
    expect(buildNumber?.isNotEmpty, true);
  });
}
