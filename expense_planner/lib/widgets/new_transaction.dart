import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
// * taking input 1st method
  final Function addTx;

  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
////  String titleInput = '', amountInput = '';
// * taking input 2nd method
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isNotEmpty && enteredAmount > 0) {
      widget.addTx(enteredTitle, enteredAmount);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // * Enter Title
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              textInputAction: TextInputAction.next,
            ),
            // * Enter Amount
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (inputData) => submitData(),
            ),
            const SizedBox(
              height: 10,
            ),
            // * Date picker
            Row(
              children: [
                const Text("No Date Chosen!!!"),
                TextButton(
                  child: const Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                onPrimary: Colors.white,
              ),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
