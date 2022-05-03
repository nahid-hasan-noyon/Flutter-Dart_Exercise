import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanse Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Expanse Planner')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // * Chart
              const Card(
                color: Colors.amber,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Chart!')),
                ),
                elevation: 5,
              ),
              // * List of Transactions
              Column(
                children: transactions.map((tx) {
                  return Card(
                      color: Colors.green,
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              tx.amount.toString(),
                            ),
                          ),
                          Column(
                            children: [
                              Text(tx.title),
                              Text(tx.date.toString())
                            ],
                          )
                        ],
                      ));
                }).toList(),
              )
            ],
          ),
        ));
  }
}
