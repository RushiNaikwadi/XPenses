import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionAdderWidget extends StatefulWidget {
  final Function transactionAdder;
  NewTransactionAdderWidget({@required this.transactionAdder});

  @override
  State<NewTransactionAdderWidget> createState() => _NewTransactionAdderWidgetState();
}

class _NewTransactionAdderWidgetState extends State<NewTransactionAdderWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void callTransactionAdder () {
    String txnTitle = _titleController.text;
    int txnAmount = int.parse(_amountController.text);

    if (txnTitle.isEmpty == true || txnAmount <= 0) {
      return;
    }

    widget.transactionAdder(
        _titleController.text,
        txnAmount,
      _selectedDate
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        color: Colors.lightGreenAccent,
        child: Card(
           color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey[900],
                  width: 1.5
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      'New Transaction',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                          _selectedDate == null ? 'No Date Chosen...' : '${DateFormat.yMMMd().format(_selectedDate)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.5
                        ),
                      ),
                      new Spacer(),
                      ElevatedButton(
                        child: Text(
                            'Choose Date',
                          style: TextStyle(
                            fontSize: 17.5,
                            color: Colors.black
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                        ),
                        onPressed: _presentDatePicker,
                      )
                    ],
                  ),
                  new Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedDate != null) {
                        callTransactionAdder();
                      }
                    },
                    child: Text(
                      'Add Transaction',
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
