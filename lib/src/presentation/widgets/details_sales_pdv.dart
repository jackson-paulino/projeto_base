import 'package:flutter/material.dart';

import '../../shared/data_struct/balance_pdv_data_struct.dart';

class DetailsSalesPdv extends StatelessWidget {
  final BalancesPdvsDataStruct balance;
  const DetailsSalesPdv(this.balance, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Text('Dinheiro', textAlign: TextAlign.left)),
            Expanded(flex: 3, child: Text(balance.money, textAlign: TextAlign.right))
          ],
        ),
        const Divider(thickness: 1),
        Row(
          children: [
            const Expanded(child: Text('Débito', textAlign: TextAlign.left)),
            Expanded(flex: 3, child: Text(balance.debitCard, textAlign: TextAlign.right))
          ],
        ),
        const Divider(thickness: 1),
        Row(
          children: [
            const Expanded(child: Text('Crédito', textAlign: TextAlign.left)),
            Expanded(flex: 3, child: Text(balance.creditCard, textAlign: TextAlign.right))
          ],
        ),
        const Divider(thickness: 1),
        Row(
          children: [
            const Expanded(
              child: Text('Total',
                  textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              flex: 3,
              child: Text(balance.total,
                  textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
