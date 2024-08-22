package com.example.flutter_pinned_shortcut_plus;

import android.app.Activity;
import android.content.Context;
import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class FlutterPinnedShortcutPlusPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  private MethodChannel channel;
  private Context context;
  private Activity activity;
  private PinnedShortcutUtil pinnedShortcutUtil;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    pinnedShortcutUtil = new PinnedShortcutUtil(context);
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_pinned_shortcut");
    channel.setMethodCallHandler(this);
  }

  @RequiresApi(api = Build.VERSION_CODES.N_MR1)
  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("createPinnedShortcut")) {
      result.success(pinnedShortcutUtil.setShortcutItem(call));
    } else if (call.method.equals("getLaunchAction")) {
      pinnedShortcutUtil.getLaunchAction(result, activity);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    // Handle if needed
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    // Handle if needed
  }
}
