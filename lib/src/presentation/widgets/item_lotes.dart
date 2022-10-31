import 'package:flutter/material.dart';

import '../../shared/data_struct/lotes_data_struct.dart';

class ItemLote extends StatelessWidget {
  final LotesDataStruct lote;
  const ItemLote(this.lote, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(textAlign: TextAlign.left, lote.name)),
            Expanded(child: Text(textAlign: TextAlign.right, lote.price)),
            Expanded(child: Text(textAlign: TextAlign.center, lote.quantity)),
            Expanded(child: Text(textAlign: TextAlign.right, lote.total))
          ],
        ),
        const Divider(thickness: 1)
      ],
    );
  }
}
