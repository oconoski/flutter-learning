import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String name;
  final int currentValue;
  final int maxValue;

  const ProgressBar({
    required this.name,
    required this.currentValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = (currentValue / maxValue);

    Color progressColor = _calculateProgressColor(percentage);

    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$name:',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$currentValue',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1, //aumentar barra
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 250,
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _calculateProgressColor(double percentage) {
    if (percentage <= 0.25) {
      return Colors.red;
    } else if (percentage <= 0.5) {
      return Colors.orange;
    } else if (percentage <= 0.75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
