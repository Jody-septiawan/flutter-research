import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Widget> widgets = [];

  _ListViewPageState() {
    for (int i = 0; i < 100; i++) {
      widgets.add(Text("Data - " + i.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: widgets),
    );
  }
}
