import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Models/TxnClass.dart';

class TxnListWidget extends StatelessWidget {
  final List <TxnClass> userTxnList;
  TxnListWidget({this.userTxnList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      height: 400,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
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
                            userTxnList[index].txnTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().add_jm().format(userTxnList[index].txnDate),
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
                        '${userTxnList[index].txnAmount} ₹',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),
                      ),
                    ),
                  ],
                )
            );
          },
        itemCount: userTxnList.length,
      ),
    );
  }
}
