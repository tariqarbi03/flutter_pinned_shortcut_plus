
import 'package:flutter_pinned_shortcut_plus/flutter_pinned_shortcut_plus_platform_interface.dart';

class FlutterPinnedShortcut {
  Future<String?> createPinnedShortcut({
    required String id,
    required String label,
    required String action,
    String? iconAssetName,
    String? iconUri
  }) {
    return FlutterPinnedShortcutPlatform.instance.createPinnedShortcut(
        id: id,
        label: label,
        action: action,
        iconAssetName: iconAssetName,
        iconUri: iconUri
    );
  }

  Future<void> getLaunchAction(
      void Function(String action) onActionReceived) async {
    return FlutterPinnedShortcutPlatform.instance
        .getLaunchAction(onActionReceived);
  }
}