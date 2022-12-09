import 'package:flutter/material.dart';

class NewTransactionAdderWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function transactionAdder;
  NewTransactionAdderWidget({@required this.transactionAdder});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.deepPurpleAccent,
              width: 3
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 15,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
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
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  transactionAdder(
                      titleController.text,
                      double.parse(amountController.text)
                  );
                },
                child: Text(
                  'Add Trasaction',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                ),
              ),

            ],
          ),
        )
    );
  }
}
