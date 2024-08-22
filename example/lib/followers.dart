import 'package:flutter/material.dart';
class MyFollowers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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