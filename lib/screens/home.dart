import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double heightContainer = 100.0;
  double widthContainer = 100.0;
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Container(
        child: Center(
            child: GestureDetector(
          onTap: () {
            double randomNumberHeight = random.nextInt(700).toDouble();
            double randomNumberWidth = random.nextInt(300).toDouble();
            setState(() {
              heightContainer = randomNumberHeight + 100.0;
              widthContainer = randomNumberWidth + 100.0;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            width: widthContainer,
            height: heightContainer,
            color: Colors.indigo,
            curve: Curves.elasticInOut,
          ),
        )),
      ))),
    );
  }
}
