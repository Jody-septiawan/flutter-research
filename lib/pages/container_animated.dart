import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class RandomContainer extends StatefulWidget {
  const RandomContainer({super.key});

  @override
  State<RandomContainer> createState() => _RandomContainerState();
}

class _RandomContainerState extends State<RandomContainer> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
          onTap: (() {
            setState(() {});
          }),
          child: AnimatedContainer(
            color: Color.fromARGB(255, random.nextInt(256), random.nextInt(256),
                random.nextInt(256)),
            duration: Duration(milliseconds: 50),
            width: 50.0 + random.nextInt(100),
            height: 50.0 + random.nextInt(100),
          )),
    ));
  }
}
