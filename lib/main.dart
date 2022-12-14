import 'package:flutter/material.dart';

import 'package:xpenses/Widgets/ChartWidget.dart';
import 'Widgets/TransactionListWidget.dart';
import 'Widgets/NewTransactionAdderWidget.dart';

import 'Models/TxnClass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal-Expenses-App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TxnClass> _userTxnList = [];

  List <TxnClass> get _recentTxn {
    return _userTxnList.where((txn) {
      return txn.txnDate.isAfter(
          DateTime.now().subtract(Duration(days: 7)) 
      );
    }).toList();
  }

  void addNewTransaction(String inputTitle, int inputAmount, DateTime chosenDate) {
    final newTxn = TxnClass(
        txnId: DateTime.now().toString(),
        txnTitle: inputTitle,
        txnAmount: inputAmount,
        txnDate: chosenDate
    );

    setState(() {
      _userTxnList.add(newTxn);
    });
  }

  void startAddingNewTxn (BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewTransactionAdderWidget(transactionAdder: addNewTransaction),
              behavior: HitTestBehavior.opaque,
          );
        }
    );
  }

  void editTxn (int index) {

  }

  void deleteTxn (String id) {
    setState(() {
      _userTxnList.removeWhere((element) {
        return element.txnId == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text(
            'Xpenses',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => startAddingNewTxn(context),
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black
                ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: ChartWidget(_recentTxn)
                ),
                (_userTxnList.isEmpty ?
                Container(
                  height: 470,
                  child: Center(
                    child: Text(
                      'No Expenses',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ),
                )
                : TxnListWidget(userTxnList: _userTxnList, txnDeleter: deleteTxn))
              ],
            ),
        ),
    );
  }
}