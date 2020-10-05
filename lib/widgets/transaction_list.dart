import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: transactions
            .map((t) => Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.deepPurple, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "\$ ${t.amount}", // \$ is to show the dollar sign and ${t.amount} is same as t.amount.toString()
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepPurple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              t.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              DateFormat.yMMMMd().format(t.date),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  elevation: 5,
                ))
            .toList(),
      ),
    );
  }
}
