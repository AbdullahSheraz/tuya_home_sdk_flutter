import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tuya_home_sdk_flutter_method_channel.dart';

abstract class TuyaHomeSdkFlutterPlatform extends PlatformInterface {
  /// Constructs a TuyaHomeSdkFlutterPlatform.
  TuyaHomeSdkFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static TuyaHomeSdkFlutterPlatform _instance = MethodChannelTuyaHomeSdkFlutter();

  /// The default instance of [TuyaHomeSdkFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelTuyaHomeSdkFlutter].
  static TuyaHomeSdkFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TuyaHomeSdkFlutterPlatform] when
  /// they register themselves.
  static set instance(TuyaHomeSdkFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
