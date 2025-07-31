import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelTuyaHomeSdkFlutter platform = MethodChannelTuyaHomeSdkFlutter();
  const MethodChannel channel = MethodChannel('tuya_home_sdk_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
