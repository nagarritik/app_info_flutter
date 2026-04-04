## 1.1.0

* Added `getFirstInstallTime()` to retrieve app first installation time as DateTime.
* Added `getLastUpdateTime()` to retrieve app last update time as DateTime.
* Added `getBuildType()` to retrieve build type (debug, release, profile) as enum.
* Added `getInstallerPackageName()` to retrieve installer package name.
* Added `getAppIcon()` to retrieve app icon as Uint8List.
* Added `getAppSize()` to retrieve total app size in bytes.
* Added `getCacheSize()` to retrieve cache size in bytes.
* Added `getTargetSdkVersion()` to retrieve target SDK version.
* Added `getMinSdkVersion()` to retrieve minimum SDK version.
* Added `getGrantedPermissions()` to retrieve list of granted permissions.
* Added `getDeclaredPermissions()` to retrieve list of declared permissions.
* Added `BuildType` enum for type-safe build type handling.
* Improved timestamp methods to return DateTime objects instead of raw milliseconds.
* Enhanced Android implementation with better permission and build type detection.

## 1.0.1

* Added missing dartdoc comments to public APIs to improve pub.dev score.

## 1.0.0
* Initial release.
* Added `getAppName` to retrieve the application name.
* Added `getPackageName` to retrieve the package identifier/bundle ID.
* Added `getVersion` to retrieve the project version.
* Added `getBuildNumber` to retrieve the build/version code.
