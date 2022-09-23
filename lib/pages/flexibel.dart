import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlexibleWidget extends StatefulWidget {
  const FlexibleWidget({super.key});

  @override
  State<FlexibleWidget> createState() => _FlexibleWidgetState();
}

class _FlexibleWidgetState extends State<FlexibleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
            )),
        Flexible(
            flex: 10,
            child: Container(
              color: Colors.white,
            )),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  color: Colors.lime,
                )),
                Flexible(
                    child: Container(
                  color: Colors.red,
                )),
                Flexible(
                    child: Container(
                  color: Colors.brown,
                )),
                Flexible(
                    child: Container(
                  color: Colors.deepPurpleAccent,
                )),
                Flexible(
                    child: Container(
                  color: Colors.lime,
                )),
              ],
            )),
      ]),
    );
  }
}
