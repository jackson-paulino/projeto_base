import 'package:flutter/material.dart';

class TotallyTicket extends StatelessWidget {
  final String column1;
  final String column2;
  final String column3;
  final bool bold;
  const TotallyTicket(this.column1, this.column2, this.column3, {Key? key, this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(column1,
                    style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal))),
            Expanded(
                child: Text(column2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal))),
            Expanded(
                child: Text(column3,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal)))
          ],
        ),
      ],
    );
  }
}
