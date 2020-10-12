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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 25),
                Flexible(child: Image.asset('assets/images/waiting.png'))
              ],
            )
            // this ListView builder is to render only transactiosn cards that are invisble and not render all at onces
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "\$ ${transactions[index].amount.toStringAsFixed(2)}", // \$ is to show the dollar sign and ${t.amount} is same as t.amount.toString()
                          // toStringAsFixed is to always show 2 digit behind . (1.00)
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Container(
                            child: Text(
                              DateFormat.yMMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  elevation: 5,
                );
              }),
    );
  }
}
