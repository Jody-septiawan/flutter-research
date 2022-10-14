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
  Random randomBox = new Random();

  double top = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Center(
        child: SizedBox(
            height: 300,
            width: 300,
            child: Stack(
              children: [
                Container(
                  color: Colors.red[200],
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  curve: Curves.elasticIn,
                  top: top,
                  left: left,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        top = randomBox.nextInt(200).toDouble();
                        left = randomBox.nextInt(200).toDouble();
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            )),
      ))),
    );
  }
}
