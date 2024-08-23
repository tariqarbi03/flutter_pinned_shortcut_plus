import 'package:flutter/material.dart';

class MyFollowers extends StatelessWidget {
  const MyFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text(
            'This is followers Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
  }
}
