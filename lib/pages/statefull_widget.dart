import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int number = 0;

  void addCounter() {
    setState(() {
      number = number + 1;
    });

    print(number);
  }

  void lessCounter() {
    setState(() {
      number = number - 1;
    });

    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Text(
        number.toString(),
        style: TextStyle(fontSize: 10 + number.toDouble()),
      ),
      TextButton(onPressed: addCounter, child: Text("Tambah")),
      TextButton(onPressed: lessCounter, child: Text("Kurang"))
    ]));
  }
}
