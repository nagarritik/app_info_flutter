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

    try {
      appName = await _appInfoFlutterPlugin.getAppName() ?? 'Unknown';
      packageName = await _appInfoFlutterPlugin.getPackageName() ?? 'Unknown';
      version = await _appInfoFlutterPlugin.getVersion() ?? 'Unknown';
      buildNumber = await _appInfoFlutterPlugin.getBuildNumber() ?? 'Unknown';
    } on PlatformException {
      appName = 'Failed to get app info.';
      packageName = 'Failed to get app info.';
      version = 'Failed to get app info.';
      buildNumber = 'Failed to get app info.';
    }

    if (!mounted) return;

    setState(() {
      _appName = appName;
      _packageName = packageName;
      _version = version;
      _buildNumber = buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('App Info Plugin Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('App Name: $_appName'),
              Text('Package Name: $_packageName'),
              Text('Version: $_version'),
              Text('Build Number: $_buildNumber'),
            ],
          ),
        ),
      ),
    );
  }
}
