import 'package:flutter/material.dart';

class ChartBarWidget extends StatelessWidget {
  final String label;
  final int spending;
  final double spendingPer;

  ChartBarWidget(this.label, this.spending, this.spendingPer);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '$spending ₹',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 125,
          width: 12.5,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5
                  ),
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: (1 - spendingPer),
                child: Container(
                  alignment: Alignment.center,
                  width: 12.5,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1.5
                      ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreenAccent
          ),
        )
      ],
    );
  }
}
