import 'package:flutter_test/flutter_test.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter_platform_interface.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTuyaHomeSdkFlutterPlatform
    with MockPlatformInterfaceMixin
    implements TuyaHomeSdkFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TuyaHomeSdkFlutterPlatform initialPlatform = TuyaHomeSdkFlutterPlatform.instance;

  test('$MethodChannelTuyaHomeSdkFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTuyaHomeSdkFlutter>());
  });

  test('getPlatformVersion', () async {
    TuyaHomeSdkFlutter tuyaHomeSdkFlutterPlugin = TuyaHomeSdkFlutter();
    MockTuyaHomeSdkFlutterPlatform fakePlatform = MockTuyaHomeSdkFlutterPlatform();
    TuyaHomeSdkFlutterPlatform.instance = fakePlatform;

    expect(await tuyaHomeSdkFlutterPlugin.getPlatformVersion(), '42');
  });
}
