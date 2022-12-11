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
                    color: Colors.brown[300],
                    elevation: 5,
                  ),
                ),
                UserTransaction()
              ],
            ),
        ),
    );
  }
}