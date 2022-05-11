import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import '../widgets/chart.dart';
import '../widgets/new_transaction.dart';

void main() {
  // * for fixing device orientation to portrait mode.
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if in mobile setting text size is changed then this will change*
    // final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expanse Planner',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline5: TextStyle(
            color: Colors.blue,
            fontSize: 25, ///// * curScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
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
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 700, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New Dress', amount: 600, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        _userTransactions.removeWhere((tx) => tx.id == id);
      },
    );
  }

  bool _chartVisible = false;
  List<Transaction> get _recentTransacations {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // AppBar
    final appBar = AppBar(
      title: const Text('Expanse Planner'),
      actions: [
        IconButton(
          onPressed: () => _displayAddNewTransaction(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );
    // * Transaction list
    final txListWidget = SizedBox(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // * Show Chart
                    const Text("Show Chart"),
                    IconButton(
                      icon: Icon(
                        _chartVisible == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _chartVisible
                              ? _chartVisible = false
                              : _chartVisible = true;
                        });
                      },
                    )
                  ],
                ),
              // * Chart

              if (!isLandscape)
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.26,
                  child: Chart(_recentTransacations),
                )
              else if (!_chartVisible)
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.7,
                  child: Chart(_recentTransacations),
                ),
              txListWidget,
              // const SizedBox(
              //   height: 4,
              // )
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
