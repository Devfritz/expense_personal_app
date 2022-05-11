import 'package:flutter/material.dart';

class InputTransaction extends StatelessWidget {
  final Function handleAddTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final entireTitle = titleController.text;
    final entireAmount = double.parse(amountController.text);
    if (entireTitle.isEmpty || entireAmount <= 0) {
      return;
    }
    handleAddTx(entireTitle, entireAmount);
  }

  InputTransaction(this.handleAddTx);
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
                  onSubmitted: (_) => submitData,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => submitData,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.blue),
                    onPressed: submitData,
                    child: Text('Add Transaction'))
              ],
            )));
  }
}
