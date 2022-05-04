import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              color: Colors.white70,
              elevation: 5,
              child: Row(
                children: [
                  // * Amount
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Transaction title
                      Text(
                        transactions[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // * Transaction date
                      Text(
                        DateFormat('dd-MM-yyyy')
                            .format(transactions[index].date),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
