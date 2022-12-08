import 'package:flutter/cupertino.dart';

class txnClass {
  final String txnId;
  final String txnTitle;
  final double txnAmount;
  final DateTime txnDate;

  txnClass({
    @required this.txnId,
    @required this.txnTitle,
    @required this.txnAmount,
    @required this.txnDate
  });
}
