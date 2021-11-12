import 'dart:math';
import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand-Light',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans-Regular',
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: 'Novo Tênis Adidas',
      value: 310.45,
      date: DateTime.now().subtract(Duration(days: 33)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis Olimpikus',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Novo Tênis Nike',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis Olimpikus',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Novo Tênis Nike',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis Olimpikus',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Novo Tênis Nike',
      value: 310.45,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    // 'where' é igual ao Filter do Javascript.
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now().subtract(Duration(days: 4)),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas Pessoais',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
