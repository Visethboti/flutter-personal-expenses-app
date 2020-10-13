import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/chartbar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTracsactions;

  Chart(this.recentTracsactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // Fine the day
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      // Add up all amount from transactions that are from the day(weekDay)
      for (int i = 0; i < recentTracsactions.length; i++) {
        if (recentTracsactions[i].date.day == weekDay.day &&
            recentTracsactions[i].date.month == weekDay.month &&
            recentTracsactions[i].date.year == weekDay.year) {
          totalSum += recentTracsactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get weekTotalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((e) {
            return Flexible(
              fit: FlexFit.tight, // this make it cannot grow bigger
              child: ChartBar(
                  e['day'].toString(),
                  e['amount'],
                  weekTotalSpending == 0
                      ? 0
                      : (e['amount'] as double) / weekTotalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}