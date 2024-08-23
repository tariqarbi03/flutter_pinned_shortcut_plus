import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pinned_shortcut_plus/flutter_pinned_shortcut_plus.dart';
import 'package:flutter_pinned_shortcut_plus/flutter_pinned_shortcut_plus_platform_interface.dart';
import 'package:flutter_pinned_shortcut_plus/flutter_pinned_shortcut_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPinnedShortcutPlusPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPinnedShortcutPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPinnedShortcutPlusPlatform initialPlatform =
      FlutterPinnedShortcutPlusPlatform.instance;

  test('$MethodChannelFlutterPinnedShortcutPlus is the default instance', () {
    expect(initialPlatform,
        isInstanceOf<MethodChannelFlutterPinnedShortcutPlus>());
  });

  test('getPlatformVersion', () async {
    FlutterPinnedShortcutPlus flutterPinnedShortcutPlusPlugin =
        FlutterPinnedShortcutPlus();
    MockFlutterPinnedShortcutPlusPlatform fakePlatform =
        MockFlutterPinnedShortcutPlusPlatform();
    FlutterPinnedShortcutPlusPlatform.instance = fakePlatform;

    expect(await flutterPinnedShortcutPlusPlugin.getPlatformVersion(), '42');
  });
}
