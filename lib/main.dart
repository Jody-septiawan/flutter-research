import 'dart:ui';
import 'package:dumbcation/provider/money_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/cart_provider.dart';
import 'provider/money_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<Money>(
              create: (context) => Money(),
            ),
            ChangeNotifierProvider<Cart>(
              create: (context) => Cart(),
            ),
          ],
          child: Scaffold(
            floatingActionButton: Consumer<Money>(
              builder: (context, money, child) => Consumer<Cart>(
                builder: (context, cart, child) => FloatingActionButton(
                  onPressed: () {
                    cart.quantity += 1;
                    money.balance -= 500;
                  },
                  child: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
            body: SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Wallet"),
                      Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Consumer<Money>(
                              builder: (context, value, child) => Text(
                                value.balance.toString(),
                                style: TextStyle(color: Colors.purple),
                              ),
                            )),
                        height: 30,
                        width: 150,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.purple[100],
                            border: Border.all(color: Colors.purple, width: 2),
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  ),
                  Container(
                    child: Consumer<Cart>(
                      builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mango (500) x " + value.quantity.toString(),
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            (500 * value.quantity).toString(),
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                    ),
                    height: 30,
                    width: 300,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
