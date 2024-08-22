
import 'flutter_pinned_shortcut_plus_platform_interface.dart';

class FlutterPinnedShortcutPlus {
  Future<String?> getPlatformVersion() {
    return FlutterPinnedShortcutPlusPlatform.instance.getPlatformVersion();
  }
}
