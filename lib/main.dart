import 'package:expense_app/Transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpensePesonalApp());
}

class ExpensePesonalApp extends StatelessWidget {
  final List<Transactions> listTransaction = [
    Transactions(
      id: '1',
      title: "Shopping",
      amount: 4555,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Expenses")),
    ));
  }
}
