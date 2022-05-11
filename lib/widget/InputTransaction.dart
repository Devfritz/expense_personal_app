import 'package:flutter/material.dart';

class InputTransaction extends StatelessWidget {
  final Function handleAddTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  InputTransaction(this.handleAddTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(5),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.blue),
                  onPressed: handleAddTx(titleController.text,
                      double.parse(amountController.text)),
                  child: Text('Add Transaction'))
            ],
          ),
        ));
  }
}
