import 'package:flutter/cupertino.dart';

class TxnClass {
  final String txnId;
  final String txnTitle;
  final int txnAmount;
  final DateTime txnDate;

  TxnClass({
    @required this.txnId,
    @required this.txnTitle,
    @required this.txnAmount,
    @required this.txnDate
  });
}
