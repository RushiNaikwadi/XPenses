import 'package:flutter/material.dart';

import '../Models/TxnClass.dart';
import 'UserTransaction/NewTransactionAdderWidget.dart';
import 'UserTransaction/TransactionListWidget.dart';

class UserTransaction extends StatefulWidget {

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<TxnClass> _userTxnList = [
    TxnClass(
        txnId: 'e7e4d8gg4',
        txnTitle: 'Breakfast',
        txnAmount: 25,
        txnDate: DateTime.now()
    ),
    TxnClass(
        txnId: 'e7t8ffg64',
        txnTitle: 'Gadget',
        txnAmount: 200,
        txnDate: DateTime.now()
    ),
    TxnClass(
        txnId: 'q9d4f5s6e',
        txnTitle: 'Headphone',
        txnAmount: 1999,
        txnDate: DateTime.now()
    )
  ];

  void addNewTransaction(String inputTitle, int inputAmount) {
    final newTxn = TxnClass(
      txnId: DateTime.now().toString(),
      txnTitle: inputTitle,
      txnAmount: inputAmount,
      txnDate: DateTime.now()
    );

    setState(() {
      _userTxnList.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionAdderWidget(transactionAdder: addNewTransaction),
        SizedBox(height: 10),
        TxnListWidget(userTxnList: _userTxnList)
      ],
    );
  }
}
