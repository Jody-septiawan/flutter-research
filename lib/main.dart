import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/statefull_widget.dart';
import 'pages/container_animated.dart';
import 'pages/flexibel.dart';
import 'pages/for_navigation/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: SafeArea(child: LoginPage()),
    );
  }
}
