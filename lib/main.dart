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
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis Olimpikus',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Novo Tênis Adidas',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Novo Tênis Nike',
      value: 310.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Novo Tênis Mizuno',
      value: 310.45,
      date: DateTime.now(),
    ),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('Grafico'),
                elevation: 5,
              ),
            ),
            Column(
              children: _transactions
                  .map(
                    (tr) => Card(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              tr.value.toString(),
                            ),
                          ),
                          Column(
                            children: [
                              Text(tr.title),
                              Text(tr.date.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ));
  }
}
