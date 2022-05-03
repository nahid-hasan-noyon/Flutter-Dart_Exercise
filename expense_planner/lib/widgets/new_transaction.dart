import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);
// * taking input 1st method
////  String titleInput = '', amountInput = '';
// * taking input 2nd method
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            // onChanged: (input) {
            //   titleInput = input;
            // },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
            //// onChanged: (input) => amountInput = input,
          ),
          FlatButton(
              child: const Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                if (kDebugMode) {
                  print(titleController);
                }
                // print(titleInput);
                // print(amountInput);
              })
        ]),
      ),
    );
  }
}
