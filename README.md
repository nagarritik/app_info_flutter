# app_info_flutter

A Flutter plugin to retrieve basic app information like name, package name, version, and build number.

## Features

- Get App Name
- Get Package Name (Bundle ID)
- Get Version (e.g., 1.0.0)
- Get Build Number (e.g., 1)
- Get First Install Time (Android)
- Get Last Update Time (Android)
- Get Build Type (Android: debug, release, profile)
- Get Installer Package Name (Android: e.g., com.android.vending for Play Store)
- Get App Icon (Android)
- Get App Size (Android)
- Get Cache Size (Android)
- Get Target SDK Version (Android)
- Get Minimum SDK Version (Android)
- Get Granted Permissions (Android)
- Get Declared Permissions (Android)

## Getting Started

Add `app_info_flutter` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  app_info_flutter: ^1.1.0
```

## Usage

```dart
import 'package:app_info_flutter/app_info_flutter.dart';

final _appInfoFlutterPlugin = AppInfoFlutter();

// Get App Name
String? appName = await _appInfoFlutterPlugin.getAppName();

// Get Package Name
String? packageName = await _appInfoFlutterPlugin.getPackageName();

// Get Version
String? version = await _appInfoFlutterPlugin.getVersion();

// Get Build Number
String? buildNumber = await _appInfoFlutterPlugin.getBuildNumber();

// Get First Install Time (returns DateTime)
DateTime? firstInstallTime = await _appInfoFlutterPlugin.getFirstInstallTime();

// Get Last Update Time (returns DateTime)
DateTime? lastUpdateTime = await _appInfoFlutterPlugin.getLastUpdateTime();

// Get Build Type (returns BuildType enum)
BuildType? buildType = await _appInfoFlutterPlugin.getBuildType();

// Get Installer Package Name
String? installerPackage = await _appInfoFlutterPlugin.getInstallerPackageName();

// Get App Icon (returns Uint8List)
Uint8List? appIcon = await _appInfoFlutterPlugin.getAppIcon();

// Get App Size (in bytes)
int? appSize = await _appInfoFlutterPlugin.getAppSize();

// Get Cache Size (in bytes)
int? cacheSize = await _appInfoFlutterPlugin.getCacheSize();

// Get Target SDK Version
int? targetSdkVersion = await _appInfoFlutterPlugin.getTargetSdkVersion();

// Get Minimum SDK Version
int? minSdkVersion = await _appInfoFlutterPlugin.getMinSdkVersion();

// Get Granted Permissions
List<String>? grantedPermissions = await _appInfoFlutterPlugin.getGrantedPermissions();

// Get Declared Permissions
List<String>? declaredPermissions = await _appInfoFlutterPlugin.getDeclaredPermissions();
```

## Platform Support

| Android | iOS |
|:---:|:---:|
| ✅ | ❌ |

### Android Requirements

For permission-related methods to work correctly, ensure you have the necessary entry in your `AndroidManifest.xml` if you're checking specific permissions.

## License

MIT License - see the [LICENSE](LICENSE) file for details.
