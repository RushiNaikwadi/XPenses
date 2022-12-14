import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:xpenses/Widgets/ChartBarWidget.dart';

import 'package:xpenses/Models/TxnClass.dart';

class ChartWidget extends StatelessWidget {
  final List<TxnClass> recentTxn;
  ChartWidget(this.recentTxn);

  List <Map<String, Object>> get groupedTxnValues {
    return List.generate(7, (index) {
       final weekDay = DateTime.now().subtract(Duration(days: index));
       int totalAmount = 0;

       for (int i = 0; i < recentTxn.length; i++) {
            if (recentTxn[i].txnDate.day == weekDay.day
                && recentTxn[i].txnDate.month == weekDay.month
                && recentTxn[i].txnDate.year == weekDay.year) {
                totalAmount += recentTxn[i].txnAmount;
            }
       }

        return {
          'day' : DateFormat.E().format(weekDay).substring(0, 3),
          'amount': totalAmount
        };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTxnValues.fold(0.0 , (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
      padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width: 1.5
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
          color: Colors.grey[700]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTxnValues.map((data) {
            return Flexible(
              child: ChartBarWidget(
                  data['day'] as String,
                  data['amount'] as int,
                  (totalSpending == 0.0 ? 0.0 : ((data['amount'] as int) / totalSpending))
              ),
            );
        }).toList(),
      ),
    );
  }
}
