import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_info_flutter/app_info_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _appName = 'Unknown';
  String _packageName = 'Unknown';
  String _version = 'Unknown';
  String _buildNumber = 'Unknown';
  String _buildType = 'Unknown';
  String _installerPackage = 'Unknown';
  String _firstInstallTime = 'Unknown';
  String _lastUpdateTime = 'Unknown';
  String _appSize = 'Unknown';
  String _cacheSize = 'Unknown';
  String _targetSdkVersion = 'Unknown';
  String _minSdkVersion = 'Unknown';
  List<String> _grantedPermissions = [];
  List<String> _declaredPermissions = [];

  final _appInfoFlutterPlugin = AppInfoFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String appName;
    String packageName;
    String version;
    String buildNumber;
    String buildType;
    String installerPackage;
    String firstInstallTime;
    String lastUpdateTime;
    String appSize;
    String cacheSize;
    String targetSdkVersion;
    String minSdkVersion;
    List<String> grantedPermissions = [];
    List<String> declaredPermissions = [];

    try {
      appName = await _appInfoFlutterPlugin.getAppName() ?? 'Unknown';
      packageName = await _appInfoFlutterPlugin.getPackageName() ?? 'Unknown';
      version = await _appInfoFlutterPlugin.getVersion() ?? 'Unknown';
      buildNumber = await _appInfoFlutterPlugin.getBuildNumber() ?? 'Unknown';

      final buildTypeEnum = await _appInfoFlutterPlugin.getBuildType();
      buildType = buildTypeEnum?.name.toUpperCase() ?? 'Unknown';

      installerPackage =
          await _appInfoFlutterPlugin.getInstallerPackageName() ?? 'Unknown';

      final firstInstall = await _appInfoFlutterPlugin.getFirstInstallTime();
      firstInstallTime = firstInstall != null
          ? firstInstall.toString()
          : 'Unknown';

      final lastUpdate = await _appInfoFlutterPlugin.getLastUpdateTime();
      lastUpdateTime = lastUpdate != null ? lastUpdate.toString() : 'Unknown';

      final size = await _appInfoFlutterPlugin.getAppSize() ?? 0;
      appSize = size > 0
          ? '${(size / 1024 / 1024).toStringAsFixed(2)} MB'
          : 'Unknown';

      final cache = await _appInfoFlutterPlugin.getCacheSize() ?? 0;
      cacheSize = cache > 0
          ? '${(cache / 1024 / 1024).toStringAsFixed(2)} MB'
          : 'Unknown';

      final targetSdk = await _appInfoFlutterPlugin.getTargetSdkVersion();
      targetSdkVersion = targetSdk?.toString() ?? 'Unknown';

      final minSdk = await _appInfoFlutterPlugin.getMinSdkVersion();
      minSdkVersion = minSdk?.toString() ?? 'Unknown';

      grantedPermissions =
          await _appInfoFlutterPlugin.getGrantedPermissions() ?? [];
      declaredPermissions =
          await _appInfoFlutterPlugin.getDeclaredPermissions() ?? [];
    } on PlatformException {
      appName = 'Failed to get app info.';
      packageName = 'Failed to get app info.';
      version = 'Failed to get app info.';
      buildNumber = 'Failed to get app info.';
      buildType = 'Failed to get app info.';
      installerPackage = 'Failed to get app info.';
      firstInstallTime = 'Failed to get app info.';
      lastUpdateTime = 'Failed to get app info.';
      appSize = 'Failed to get app info.';
      cacheSize = 'Failed to get app info.';
      targetSdkVersion = 'Failed to get app info.';
      minSdkVersion = 'Failed to get app info.';
    }

    if (!mounted) return;

    setState(() {
      _appName = appName;
      _packageName = packageName;
      _version = version;
      _buildNumber = buildNumber;
      _buildType = buildType;
      _installerPackage = installerPackage;
      _firstInstallTime = firstInstallTime;
      _lastUpdateTime = lastUpdateTime;
      _appSize = appSize;
      _cacheSize = cacheSize;
      _targetSdkVersion = targetSdkVersion;
      _minSdkVersion = minSdkVersion;
      _grantedPermissions = grantedPermissions;
      _declaredPermissions = declaredPermissions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('App Info Plugin Example')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('App Name: $_appName'),
                Text('Package Name: $_packageName'),
                Text('Version: $_version'),
                Text('Build Number: $_buildNumber'),
                const SizedBox(height: 16),
                const Text(
                  'Build Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Build Type: $_buildType'),
                Text('Target SDK: $_targetSdkVersion'),
                Text('Min SDK: $_minSdkVersion'),
                const SizedBox(height: 16),
                const Text(
                  'Installation Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Installer: $_installerPackage'),
                Text('First Installed: $_firstInstallTime'),
                Text('Last Updated: $_lastUpdateTime'),
                const SizedBox(height: 16),
                const Text(
                  'Storage Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('App Size: $_appSize'),
                Text('Cache Size: $_cacheSize'),
                const SizedBox(height: 16),
                const Text(
                  'Permissions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Granted:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ..._grantedPermissions
                    .map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(p),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 8),
                const Text(
                  'Declared:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ..._declaredPermissions
                    .map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(p),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
