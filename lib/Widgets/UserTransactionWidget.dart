import 'package:flutter/material.dart';

import '../Models/TxnClass.dart';
import 'UserTransaction/NewTransactionWidget.dart';
import 'UserTransaction/TransactionListWidget.dart';

class UserTransaction extends StatefulWidget {

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<TxnClass> _userTxnList = [
    TxnClass(
        txnId: 'xZMEHDF',
        txnTitle: 'Breakfast',
        txnAmount: 25,
        txnDate: DateTime.now()
    ),
    TxnClass(
        txnId: 'xYRHGDB',
        txnTitle: 'Gadget',
        txnAmount: 200,
        txnDate: DateTime.now()
    )
  ];

  void addNewTransaction(String inputTitle, double inputAmount) {
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
        NewTransaction(transactionAdder: addNewTransaction),
        TxnListWidget(userTxnList: _userTxnList)
      ],
    );
  }
}
