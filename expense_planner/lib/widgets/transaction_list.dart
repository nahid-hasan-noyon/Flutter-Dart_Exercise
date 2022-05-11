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
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'No Transactions added yet',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Image.asset('assets/images/no_transactions.png')
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    // exchange of card which is below commented
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      // style:,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// Card(
//                     color: Colors.white70,
//                     elevation: 5,
//                     child: Row(
//                       children: [
//                         // * Amount
//                         Container(
//                           margin: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                             color: Theme.of(context).primaryColorDark,
//                             width: 2,
//                           )),
//                           padding: const EdgeInsets.all(10),
//                           child: Text(
//                             '\$${transactions[index].amount.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                                 color: Colors.green),
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // * Transaction title
//                             Text(
//                               transactions[index].title,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             // * Transaction date
//                             Text(
//                               DateFormat('dd-MM-yyyy')
//                                   .format(transactions[index].date),
//                               style: const TextStyle(color: Colors.grey),
//                             )
//                           ],
//                         ),
//                       ],
//                     ));
//               },
