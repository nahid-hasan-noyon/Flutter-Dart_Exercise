import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.amber,
      Colors.blue,
      Colors.red,
      Colors.green,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        // exchange of card which is below commented
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          // @@@ Container(
          // height: 60,
          // width: 60,
          // decoration: const BoxDecoration(
          //   color: Colors.blue,
          //   shape: BoxShape.circle,
          // ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton(
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    widget.deleteTransaction(widget.transaction.id);
                  },
                ),
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 30,
                color: Colors.red,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              ),
      ),
    );
  }
}
