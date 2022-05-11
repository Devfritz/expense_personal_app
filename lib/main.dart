import 'package:expense_app/widget/InputTransaction.dart';
import 'package:expense_app/widget/listTransations.dart';
import 'package:expense_app/widget/userTransactions.dart';
import 'package:flutter/material.dart';

import 'package:expense_app/models/Transactions.dart';

void main() {
  runApp(ExpensePesonalApp());
}

// ignore: use_key_in_widget_constructors
class ExpensePesonalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Expenses")),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  margin: EdgeInsets.only(top: 20),
                  child: Card(
                    color: Colors.blueGrey,
                    child: Text(
                      "Chart",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                UserTransaction(),
              ]),
        ));
  }
}
