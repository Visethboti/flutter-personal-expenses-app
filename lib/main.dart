import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses App"),
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
      ),
    );
  }
}
