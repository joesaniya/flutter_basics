import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  String name;
  String email;
  WelcomeScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to the App!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text('Name:$name ', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text('Email: $email', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
