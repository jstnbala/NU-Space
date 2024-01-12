//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A5299),
      body: Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/confroom.jpg",
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Color(0xFF4A5299).withOpacity(0.5),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/NU Space Logo.png",
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Welcome, Nationalian!',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          // Add other widgets below the image if needed
        ],
      ),
    );
  }
}
