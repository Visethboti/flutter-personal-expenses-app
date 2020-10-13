import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.length < 1 || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context)
        .pop(); // auto close the new_transaction sheet after adding
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // the .then take a function as a parameter and will execute it when the user has chosen a date
      if (pickedDate == null) {
        // meaning if user press cancel and did not pick a date, then return (meaning do nothing)
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: [
                Text(_selectedDate == null
                    ? "No Date Choosen"
                    : "Picked date: " + DateFormat.yMMMMd().format(_selectedDate)),
                FlatButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: Text(
                    "Choose Date",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: Text("Add Transaction"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: () {
                _submitData();
              },
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
