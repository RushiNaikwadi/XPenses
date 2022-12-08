import 'package:flutter/material.dart';

import './transactionClass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<txnClass> txnList = [
    txnClass(
      txnId: 'xZMEHDF',
      txnTitle: 'Breakfast',
      txnAmount: 25,
      txnDate: DateTime.now()
    ),
    txnClass(
        txnId: 'xYRHGDB',
        txnTitle: 'Gadget',
        txnAmount: 200,
        txnDate: DateTime.now()
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Text(
                'Week Chart',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              color: Colors.indigoAccent,
              elevation: 5,
            ),
            Column(
              children: txnList.map((txn) {
                return Card(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(txn.txnTitle),
                          Text(txn.txnDate.toString())
                        ],
                      ),
                      new Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
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
                          '${txn.txnAmount.toString()} ₹',
                          style: TextStyle(
                            fontSize: 17
                          ),
                        ),
                      ),
                    ],
                  )
                );
              }).toList()
            )
          ],
        ));
  }
}
