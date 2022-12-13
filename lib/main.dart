import 'package:flutter/material.dart';

import 'Widgets/TransactionListWidget.dart';
import 'Widgets/NewTransactionAdderWidget.dart';

import 'Models/TxnClass.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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

  void startAddingNewTxn (BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransactionAdderWidget(transactionAdder: null,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Xpenses',
            style: TextStyle(
              color: Colors.yellow
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.yellow[700],
                ),
            ),
          ],
          backgroundColor: Colors.grey[900],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 2),
                  padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 2.5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey[900],
                          width: 3
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Week Chart',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: Colors.blue[300],
                    elevation: 5,
                  ),
                ),
                NewTransactionAdderWidget(transactionAdder: addNewTransaction),
                SizedBox(height: 7.5),
                TxnListWidget(userTxnList: _userTxnList)
              ],
            ),
        ),
    );
  }
}