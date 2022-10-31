import 'package:flutter/material.dart';

import '../../shared/data_struct/sales_dates_data_struct.dart';

class ContentSalesDates extends StatelessWidget {
  final SalesDatesDataStruct salesDates;
  final Future<void> Function() onRefresh;
  const ContentSalesDates(this.salesDates, {Key? key, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: salesDates.sales.isEmpty
          ? const Center(child: Text('Relatorio sem Dados'))
          : ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text(
                  'Vendas Por Data',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15),
                Row(children: const [
                  Expanded(child: Text('Data', textAlign: TextAlign.left)),
                  Expanded(child: Text('Quant', textAlign: TextAlign.right)),
                  Expanded(flex: 2, child: Text('Total', textAlign: TextAlign.right)),
                ]),
                const Divider(thickness: 1),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: salesDates.sales.length,
                  itemBuilder: (context, index) {
                    final item = salesDates.sales[index];
                    return Column(
                      children: [
                        Row(children: [
                          Expanded(child: Text(item.selledDate, textAlign: TextAlign.left)),
                          Expanded(child: Text(item.quantity, textAlign: TextAlign.right)),
                          Expanded(flex: 2, child: Text(item.total, textAlign: TextAlign.right)),
                        ]),
                        const Divider(thickness: 1),
                      ],
                    );
                  },
                ),
                Row(children: [
                  const Expanded(
                      child: Text('Total',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                  Expanded(
                      child: Text(salesDates.quantityGeneral,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                  Expanded(
                      flex: 2,
                      child: Text(salesDates.totalGeneral,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                ]),
                const SizedBox(height: 20),
                Row(children: [
                  const Text('Total de Ingressos Validados:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 5),
                  Text(salesDates.quantityValidated,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ]),
                const SizedBox(height: 30),
              ],
            ),
    );
  }
}
