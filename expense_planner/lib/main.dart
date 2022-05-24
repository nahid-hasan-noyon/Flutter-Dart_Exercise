import 'package:flutter/foundation.dart';
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 700,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'New Dress',
    //   amount: 600,
    //   date: DateTime.now(),
    // ),
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

  bool _chartVisible = true;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (kDebugMode) {
      print(state);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('state');
    }
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        _userTransactions.removeWhere((tx) => tx.id == id);
      },
    );
  }

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

  Widget _buildLandscapeContent(MediaQueryData mQC, AppBar appBar) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // * Show Chart
        const Text("Show Chart"),
        IconButton(
          icon: Icon(
            _chartVisible == false ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _chartVisible ? _chartVisible = false : _chartVisible = true;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPortraitContent(MediaQueryData mQC, AppBar appBar) {
    return SizedBox(
      height:
          (mQC.size.height - appBar.preferredSize.height - mQC.padding.top) *
              0.26,
      child: Chart(_recentTransacations),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mQC = MediaQuery.of(context);
    final isLandscape = mQC.orientation == Orientation.landscape;
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
      height:
          (mQC.size.height - appBar.preferredSize.height - mQC.padding.top) *
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
              // * Chart
              if (isLandscape)
                _buildLandscapeContent(mQC, appBar)
              else
                _buildPortraitContent(mQC, appBar),

              if (!_chartVisible && isLandscape)
                SizedBox(
                  height: (mQC.size.height -
                          appBar.preferredSize.height -
                          mQC.padding.top) *
                      0.7,
                  child: Chart(_recentTransacations),
                ),
              // * List of Transactions
              txListWidget,
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
