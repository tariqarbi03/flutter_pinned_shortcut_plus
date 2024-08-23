# flutter_pinned_shortcut_plus


      Flutter pinned shortcuts provide quick access to key actions or views in an app. In chat apps, users can pin threads, contacts, or actions for easy access, reducing the need for extra navigation.



```dart
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pinned_shortcut_plus/flutter_pinned_shortcut_plus.dart';
import 'package:flutter_pinned_shortcut_plus_example/followers.dart';
import 'package:flutter_pinned_shortcut_plus_example/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final _flutterPinnedShortcutPlugin = FlutterPinnedShortcut();

  @override
  void initState() {
    super.initState();
    //Manage condition according to your need
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIncomingAction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,  // Set the navigatorKey here
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pinned Shortcut'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: addPinnedShortcut,
                child: const Text("Add Follower Shortcut with Icon"),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: addPinnedShortcut1,
                child: const Text("Add Profile Shortcut With Url"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addPinnedShortcut() {
    //first of all it will check iconUri if it will be null it will display assetIcon otherwise it will add url icon
    _flutterPinnedShortcutPlugin.createPinnedShortcut(
        id: "1",
        label: "Followers",
        action: "followers",
        iconAssetName: "assets/splash.png",
        iconUri: null
    );
  }

  void addPinnedShortcut1() async{
    //first of all it will check iconUri if it will be null it will display assetIcon otherwise it will add url icon
    File? file;
      file = await DefaultCacheManager().getSingleFile("https://cdn-icons-png.flaticon.com/512/7347/7347153.png");
    _flutterPinnedShortcutPlugin.createPinnedShortcut(
        id: "2",
        label: "Profile",
        action: "profile",
        iconAssetName: "assets/splash.png",
        iconUri: Uri.file(file.path).toString()
    );
  }

  void getIncomingAction() {
    _flutterPinnedShortcutPlugin.getLaunchAction((action) {
      switch (action) {
        case "followers":
          if (kDebugMode) {
            print("Malik Tariq Azam-$action");
          }
          // Use the navigatorKey to push the route or any other state manage
          _navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (context) => MyFollowers()),
          );
          break;
        case "profile":
        // Use the navigatorKey to push the route or any other state manage
          _navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (context) => MyProfile()),
          );
          break;
      }
    });
  }
}

import 'package:flutter/material.dart';
class MyFollowers extends StatelessWidget {
  const MyFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'This is followers Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'This is profile Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

For more information, see the full documentation at:
[https://github.com/tariqarbi03/flutter_pinned_shortcut_plus/tree/master](https://github.com/tariqarbi03/flutter_pinned_shortcut_plus/tree/master)
