import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanse Planner',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: const Color.fromARGB(255, 220, 191, 86),
        ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                  titleLarge: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
                .headline6),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _displayAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {
              // does nothing.
            },
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanse Planner'),
        actions: [
          IconButton(
            onPressed: () => _displayAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
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
              TransactionList(_userTransactions),
              // * List of Transactions
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _displayAddNewTransaction(context),
      ),
    );
  }
}
