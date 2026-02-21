# app_info_flutter

A Flutter plugin to retrieve basic app information like name, package name, version, and build number.

## Features

- Get App Name
- Get Package Name (Bundle ID)
- Get Version (e.g., 1.0.0)
- Get Build Number (e.g., 1)

## Getting Started

Add `app_info_flutter` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  app_info_flutter: ^1.0.0
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
```

## Platform Support

| Android | iOS |
|:---:|:---:|
| ✅ | ❌ |

## License

MIT License - see the [LICENSE](LICENSE) file for details.
