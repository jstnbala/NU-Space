//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NU SPACE',
      theme: ThemeData(primaryColor: Color(0xFF4A5299),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
