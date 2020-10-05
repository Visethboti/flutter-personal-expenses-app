import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';

import './models/transaction.dart';
import './widgets/user_transaction.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'kfc', amount: 11.25, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'shopping', amount: 27.5, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'shopping', amount: 27.5, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'shopping', amount: 27.5, date: DateTime.now()),
  ];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses App"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Text("Chart here!"),
                  elevation: 5, // elevation is shadow
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
      ),
    );
  }
}
