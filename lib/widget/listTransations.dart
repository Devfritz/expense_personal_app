import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transactions.dart';

class ListTransactions extends StatelessWidget {
  final List<Transactions> listTransaction;

  ListTransactions(this.listTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemCount: listTransaction.length,
          itemBuilder: ((context, index) {
            return Card(
              child: Row(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 2)),
                  child: Text(
                    '\$ ${listTransaction[index].amount.toString()}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      listTransaction[index].title.toString(),
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    )),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          DateFormat.yMMM().format(listTransaction[index].date),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ))
                  ],
                )
              ]),
            );
          }),
        ));
  }
}
