import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
        body: Center(
          child: Text(
            'This is profile Screen',
            style: TextStyle(fontSize: 24),
          ),
      ),
    );
  }
}
