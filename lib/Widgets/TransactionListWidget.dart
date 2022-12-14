import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../Models/TxnClass.dart';

class TxnListWidget extends StatelessWidget {
  final List <TxnClass> userTxnList;
  final Function txnDeleter;
  TxnListWidget({this.userTxnList, this.txnDeleter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.grey[700],
                elevation: 20,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.grey[900],
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purpleAccent,
                      child: Padding(
                        padding: EdgeInsets.all(7.5),
                        child: FittedBox(
                          child: Text(
                            '${userTxnList[index].txnAmount} ₹',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      userTxnList[index].txnTitle,
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTxnList[index].txnDate),
                      style: TextStyle(
                          color: Colors.yellow[200]
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => txnDeleter(userTxnList[index].txnId),
                      color: Colors.red[400],
                    ),
                  ),
                ),
              );
          },
        itemCount: userTxnList.length,
      ),
    );
  }
}
