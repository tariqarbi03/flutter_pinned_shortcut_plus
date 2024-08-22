import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_pinned_shortcut_plus_method_channel.dart';

abstract class FlutterPinnedShortcutPlusPlatform extends PlatformInterface {
  /// Constructs a FlutterPinnedShortcutPlusPlatform.
  FlutterPinnedShortcutPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPinnedShortcutPlusPlatform _instance = MethodChannelFlutterPinnedShortcutPlus();

  /// The default instance of [FlutterPinnedShortcutPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPinnedShortcutPlus].
  static FlutterPinnedShortcutPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPinnedShortcutPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterPinnedShortcutPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
