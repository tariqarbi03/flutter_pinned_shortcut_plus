import 'package:flutter/material.dart';
class MyFollowers extends StatelessWidget {
  const MyFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'This is followersa Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}