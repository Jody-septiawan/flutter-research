import 'package:flutter/material.dart';
import 'screens/add_user.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Research Test App',
      routes: {
        '/home': (context) => HomePage(),
        '/add-user': (context) => AddUserPage(),
      },
      home: HomePage(),
      initialRoute: '/home',
    );
  }
}
