
import 'tuya_home_sdk_flutter_platform_interface.dart';

class TuyaHomeSdkFlutter {
  Future<String?> getPlatformVersion() {
    return TuyaHomeSdkFlutterPlatform.instance.getPlatformVersion();
  }
}
