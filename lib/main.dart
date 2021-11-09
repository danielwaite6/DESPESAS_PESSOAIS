import 'package:flutter/material.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:intl/intl.dart';

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
      value: 310.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Novo Tênis Nike',
      value: 310.2,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Novo Tênis Mizuno',
      value: 310.5,
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
                child: Text('Gráfico'),
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
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'R\$ ${tr.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat('d MMM y').format(tr.date),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
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
