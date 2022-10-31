import 'package:flutter/material.dart';

import '../../shared/data_struct/sales_pdv_data_struct.dart';

class TotaisSalesPdv extends StatelessWidget {
  final SalesPdvDataStruct salesPdv;
  const TotaisSalesPdv(this.salesPdv, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Text('Dinheiro', textAlign: TextAlign.left)),
            Expanded(flex: 3, child: Text(salesPdv.moneyGeneral, textAlign: TextAlign.right))
          ],
        ),
        const Divider(thickness: 1),
        Row(
          children: [
            const Expanded(child: Text('Débito', textAlign: TextAlign.left)),
            Expanded(flex: 3, child: Text(salesPdv.debitCardGeneral, textAlign: TextAlign.right))
          ],
        ),
        const Divider(thickness: 1),
        Row(
          children: [
            const Expanded(child: Text('Crédito', textAlign: TextAlign.left)),
            Expanded(flex: 3, child: Text(salesPdv.creditCardGeneral, textAlign: TextAlign.right))
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
              child: Text(salesPdv.totalGeneral,
                  textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
