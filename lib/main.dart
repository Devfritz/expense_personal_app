import 'package:flutter/material.dart';
import 'package:expense_app/widget/InputTransaction.dart';
import 'package:expense_app/widget/listTransations.dart';
import 'package:expense_app/models/Transactions.dart';
// import 'package:expense_app/widget/userTransactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: TextStyle(fontSize: 18),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: ExpensePersonalApp(),
    );
  }
}

class ExpensePersonalApp extends StatefulWidget {
  // const ExpensePersonalApp({Key? key}) : super(key: key);

  @override
  _ExpensePesonalAppState createState() => _ExpensePesonalAppState();
}

// ignore: use_key_in_widget_constructors
class _ExpensePesonalAppState extends State<ExpensePersonalApp> {
  final List<Transactions> _listTransaction = [
    // Transactions(
    //   id: '1',
    //   title: "Shopping",
    //   amount: 4555,
    //   date: DateTime.now(),
    // ),
  ];

  void _addTransaction(String title, double amount) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _listTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: InputTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              ListTransactions(_listTransaction)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
