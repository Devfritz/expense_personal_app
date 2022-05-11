import 'package:flutter/material.dart';
import '../models/Transactions.dart';
import 'package:expense_app/widget/listTransations.dart';
import 'package:expense_app/widget/InputTransaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> listTransaction = [
    Transactions(
      id: '1',
      title: "Shopping",
      amount: 4555,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      listTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputTransaction(_addTransaction),
        ListTransactions(listTransaction)
      ],
    );
  }
}
