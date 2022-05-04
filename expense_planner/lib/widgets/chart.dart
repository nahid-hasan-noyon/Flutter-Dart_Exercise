import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weakDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weakDay.day &&
              recentTransactions[i].date.day == weakDay.day &&
              recentTransactions[i].date.day == weakDay.day) {
            totalSum += recentTransactions[i].amount;
          }
        }
        if (kDebugMode) {
          print(DateFormat.E().format(weakDay));
          print(totalSum);
        }

        return {
          'day': DateFormat.E().format(weakDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    );
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return ChartBar(
              (data['day'] as String),
              (data['amount'] as double),
              totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
