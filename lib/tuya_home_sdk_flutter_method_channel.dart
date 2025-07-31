import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tuya_home_sdk_flutter_platform_interface.dart';

/// An implementation of [TuyaHomeSdkFlutterPlatform] that uses method channels.
class MethodChannelTuyaHomeSdkFlutter extends TuyaHomeSdkFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tuya_home_sdk_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
