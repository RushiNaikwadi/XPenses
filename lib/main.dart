import 'package:flutter/material.dart';
import 'package:xpenses/Widgets/UserTransactionWidget.dart';

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

class MyHomePage extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Xpenses'),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Text(
                    'Week Chart',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.grey[400],
                  elevation: 5,
                ),
                UserTransaction()
              ],
            ),
        ),
    );
  }
}