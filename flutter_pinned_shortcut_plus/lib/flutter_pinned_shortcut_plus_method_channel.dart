import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_pinned_shortcut_plus_platform_interface.dart';

/// An implementation of [FlutterPinnedShortcutPlusPlatform] that uses method channels.
class MethodChannelFlutterPinnedShortcutPlus extends FlutterPinnedShortcutPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pinned_shortcut_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
