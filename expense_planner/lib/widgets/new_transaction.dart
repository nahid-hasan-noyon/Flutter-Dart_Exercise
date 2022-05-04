import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
// * taking input 1st method
////  String titleInput = '', amountInput = '';
// * taking input 2nd method
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isNotEmpty && enteredAmount > 0) {
      addTx(enteredTitle, enteredAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          // * Enter Title
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            textInputAction: TextInputAction.next,
            //(inputData) => submitData(),

            // onChanged: (input) {
            //   titleInput = input;
            // },
          ),
          // * Enter Amount
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (inputData) => submitData(),
            //// onChanged: (input) => amountInput = input,
          ),
          FlatButton(
            child: const Text('Add Transaction'),
            textColor: Colors.purple,
            onPressed: submitData,
          )
        ]),
      ),
    );
  }
}
