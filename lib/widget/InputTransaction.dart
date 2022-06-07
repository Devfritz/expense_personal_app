import 'package:flutter/material.dart';

class InputTransaction extends StatefulWidget {
  final Function handleAddTx;

  InputTransaction(this.handleAddTx);

  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final entireTitle = titleController.text;
    final entireAmount = double.parse(amountController.text);
    if (entireTitle.isEmpty || entireAmount <= 0) {
      return;
    }
    widget.handleAddTx(entireTitle, entireAmount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.blue),
                  onPressed: submitData,
                  child: Text('Add Transaction'),
                ),
              ],
            )));
  }
}
