import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Models/TxnClass.dart';

class TxnListWidget extends StatelessWidget {
  final List <TxnClass> userTxnList;
  TxnListWidget({this.userTxnList});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: userTxnList.map((txn) {
          return Card(
              elevation: 15,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 2.5,
                        horizontal: 7.5
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 2.5,
                        horizontal: 2.5
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          txn.txnTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().add_jm().format(txn.txnDate),
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 7.5,
                        horizontal: 5
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.indigo,
                            width: 2
                        )
                    ),
                    child: Text(
                      '${txn.txnAmount} ₹',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                    ),
                  ),
                ],
              )
          );
        }).toList()
    );
  }
}
