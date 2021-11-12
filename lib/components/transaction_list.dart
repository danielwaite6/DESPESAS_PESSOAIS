//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma Transação Cadastrada.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
