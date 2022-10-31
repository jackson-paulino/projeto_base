import 'package:flutter/material.dart';

import '../../shared/data_struct/sales_pdv_data_struct.dart';
import 'details_sales_pdv.dart';
import 'totais_sales_pdv.dart';

class ContentSalesPdvPage extends StatelessWidget {
  final SalesPdvDataStruct salesPdv;
  final Future<void> Function() onRefresh;
  const ContentSalesPdvPage(this.salesPdv, {Key? key, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: salesPdv.balancesPdvs.isEmpty
          ? const Center(child: Text('Relatorio sem Dados'))
          : ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text(
                  'Vendas Por Pdv',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: salesPdv.balancesPdvs.length,
                  itemBuilder: (context, index) {
                    var balance = salesPdv.balancesPdvs[index];
                    return Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(balance.pdvName,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400))),
                        const Divider(thickness: 1),
                        DetailsSalesPdv(balance),
                        const SizedBox(height: 15),
                      ],
                    );
                  },
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Total Geral',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const Divider(thickness: 1),
                TotaisSalesPdv(salesPdv),
                const SizedBox(height: 30),
              ],
            ),
    );
  }
}
