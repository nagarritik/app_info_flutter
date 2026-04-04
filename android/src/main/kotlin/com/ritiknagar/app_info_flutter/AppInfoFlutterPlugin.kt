package com.ritiknagar.app_info_flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.graphics.drawable.Drawable
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import java.io.ByteArrayOutputStream
import android.graphics.Bitmap
import android.graphics.Canvas
import androidx.core.content.ContextCompat
import androidx.core.content.pm.PackageInfoCompat
import android.os.Build
import java.io.File

/** AppInfoFlutterPlugin */
class AppInfoFlutterPlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: android.content.Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_info_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        try {
            val packageManager = context.packageManager
            val packageInfoFlags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                android.content.pm.PackageManager.GET_PERMISSIONS
            } else {
                0
            }
            
            val packageInfo = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU) {
                packageManager.getPackageInfo(context.packageName, android.content.pm.PackageManager.PackageInfoFlags.of(packageInfoFlags.toLong()))
            } else {
                @Suppress("DEPRECATION")
                packageManager.getPackageInfo(context.packageName, packageInfoFlags)
            }

            when (call.method) {
                "getAppName" -> {
                    val appName = packageInfo.applicationInfo?.loadLabel(packageManager)?.toString()
                    result.success(appName)
                }
                "getPackageName" -> {
                    result.success(context.packageName)
                }
                "getVersion" -> {
                    result.success(packageInfo.versionName)
                }
                "getBuildNumber" -> {
                    val buildNumber = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
                        packageInfo.longVersionCode.toString()
                    } else {
                        @Suppress("DEPRECATION")
                        packageInfo.versionCode.toString()
                    }
                    result.success(buildNumber)
                }
                "getFirstInstallTime" -> {
                    result.success(packageInfo.firstInstallTime)
                }
                "getLastUpdateTime" -> {
                    result.success(packageInfo.lastUpdateTime)
                }
                "getBuildType" -> {
                    val buildType = try {
                        val isDebuggable = (packageInfo.applicationInfo?.flags ?: 0) and ApplicationInfo.FLAG_DEBUGGABLE != 0
                        if (isDebuggable) "debug" else "release"
                    } catch (e: Exception) {
                        try {
                            val buildConfigClass = Class.forName("${context.packageName}.BuildConfig")
                            val buildTypeField = buildConfigClass.getField("BUILD_TYPE")
                            buildTypeField.get(null) as String
                        } catch (e: Exception) {
                            "release"
                        }
                    }
                    result.success(buildType)
                }
                "getInstallerPackageName" -> {
                    val installerPackage = try {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                            context.packageManager.getInstallSourceInfo(context.packageName).installingPackageName
                        } else {
                            @Suppress("DEPRECATION")
                            context.packageManager.getInstallerPackageName(context.packageName)
                        }
                    } catch (e: Exception) {
                        null
                    }
                    result.success(installerPackage)
                }
                "getAppIcon" -> {
                    try {
                        val appIcon = packageInfo.applicationInfo?.let {
                            packageManager.getApplicationIcon(it)
                        }
                        val iconBytes = drawableToByteArray(appIcon)
                        result.success(iconBytes)
                    } catch (e: Exception) {
                        result.error("IconError", e.message, null)
                    }
                }
                "getAppSize" -> {
                    try {
                        val appSize = getAppSize()
                        result.success(appSize)
                    } catch (e: Exception) {
                        result.error("SizeError", e.message, null)
                    }
                }
                "getCacheSize" -> {
                    try {
                        val cacheSize = context.cacheDir.totalSize()
                        result.success(cacheSize)
                    } catch (e: Exception) {
                        result.error("CacheError", e.message, null)
                    }
                }
                "getTargetSdkVersion" -> {
                    val targetSdk = packageInfo.applicationInfo?.targetSdkVersion
                    result.success(targetSdk)
                }
                "getMinSdkVersion" -> {
                    val minSdk = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                        packageInfo.applicationInfo?.minSdkVersion
                    } else {
                        null
                    }
                    result.success(minSdk)
                }
                "getGrantedPermissions" -> {
                    try {
                        val grantedPermissions = mutableListOf<String>()
                        
                        // Get all declared permissions from the package
                        val requestedPermissions = packageInfo.requestedPermissions ?: emptyArray()
                        
                        for (perm in requestedPermissions) {
                            if (ContextCompat.checkSelfPermission(context, perm) == PackageManager.PERMISSION_GRANTED) {
                                grantedPermissions.add(perm)
                            }
                        }
                        result.success(grantedPermissions)
                    } catch (e: Exception) {
                        result.error("PermissionError", e.message, null)
                    }
                }
                "getDeclaredPermissions" -> {
                    try {
                        val declaredPermissions = mutableListOf<String>()
                        
                        // Get all declared permissions from the package manifest
                        val requestedPermissions = packageInfo.requestedPermissions ?: emptyArray()
                        declaredPermissions.addAll(requestedPermissions)
                        
                        result.success(declaredPermissions)
                    } catch (e: Exception) {
                        result.error("PermissionError", e.message, null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        } catch (e: Exception) {
            result.error("AppInfoError", e.message, null)
        }
    }

    private fun drawableToByteArray(drawable: Drawable?): ByteArray? {
        if (drawable == null) return null

        val bitmap = if (drawable is android.graphics.drawable.BitmapDrawable) {
            drawable.bitmap
        } else {
            val width = drawable.intrinsicWidth
            val height = drawable.intrinsicHeight
            val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
            val canvas = Canvas(bitmap)
            drawable.setBounds(0, 0, canvas.width, canvas.height)
            drawable.draw(canvas)
            bitmap
        }

        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
        return stream.toByteArray()
    }

    private fun getAppSize(): Long {
        val appDir = File("/data/data/${context.packageName}")
        return if (appDir.exists()) {
            appDir.totalSize()
        } else {
            0L
        }
    }

    private fun File.totalSize(): Long {
        return if (isFile) {
            length()
        } else {
            var size = 0L
            listFiles()?.forEach { file ->
                size += file.totalSize()
            }
            size
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
