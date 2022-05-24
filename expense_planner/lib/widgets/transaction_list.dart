import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  const TransactionList(this.transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No Transactions added yet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/no_transactions.png'),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTransaction: deleteTransaction,
                  ),
                )
                .toList(),
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
