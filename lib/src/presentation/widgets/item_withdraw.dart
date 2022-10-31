import 'package:flutter/material.dart';

class ItemWithdraw extends StatelessWidget {
  final String name;
  final String value;
  final bool bold;
  final bool divider;
  const ItemWithdraw(
    this.name,
    this.value, {
    Key? key,
    this.bold = false,
    this.divider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              name,
              style: bold ? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold) : null,
            )),
            Expanded(
                child: Text(
              value,
              textAlign: TextAlign.right,
              style: bold ? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold) : null,
            ))
          ],
        ),
        divider ? const Divider(thickness: 1) : const SizedBox()
      ],
    );
  }
}
