import 'package:flutter/material.dart';

class NewTransactionAdderWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function transactionAdder;
  NewTransactionAdderWidget({@required this.transactionAdder});

  void callTransactionAdder () {
    String txnTitle = titleController.text;
    int txnAmount = int.parse(amountController.text);

    if (txnTitle.isEmpty == true || txnAmount <= 0) {
      return;
    }

    transactionAdder(
        titleController.text,
        txnAmount
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 0),
      child: Card(
         color: Colors.purpleAccent[100],
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey[900],
                width: 3
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () => callTransactionAdder(),
                  child: Text(
                    'Add Trasaction',
                    style: TextStyle(
                        color: Colors.yellow
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
                  ),
                ),
                SizedBox(height: 5)
              ],
            ),
          )
      ),
    );
  }
}
