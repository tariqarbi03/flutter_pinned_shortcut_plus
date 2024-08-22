import 'package:flutter/material.dart';
class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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