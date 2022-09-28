import 'package:dumbcation/provider/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/color_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: ChangeNotifierProvider<ColorProvider>(
        create: (context) => ColorProvider(),
        child: Scaffold(
            appBar: AppBar(
                title: Consumer<ColorProvider>(
                    builder: (context, value, _) => Text(
                          "Color Provider State management",
                          style: TextStyle(color: value.color),
                        ))),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<ColorProvider>(
                      builder: (context, value, _) => AnimatedContainer(
                          width: 100,
                          height: 100,
                          color: value.color,
                          duration: Duration(milliseconds: 500)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text("Yellow"),
                        ),
                        Consumer<ColorProvider>(
                          builder: (context, value, child) => Switch(
                            value: value.isLightBlue,
                            onChanged: (newValue) {
                              value.isLightBlue = newValue;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text("Red"),
                        ),
                      ],
                    )
                  ]),
            )),
      ),
    );
  }
}
