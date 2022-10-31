import 'package:flutter/material.dart';

import '../../shared/data_struct/withdraw_pdv_data_struct.dart';
import 'item_withdraw.dart';

class ContentWithdrawPdv extends StatelessWidget {
  final WithdrawPdvDataStruct withdrawPdv;
  final Future<void> Function() onRefresh;
  const ContentWithdrawPdv(this.withdrawPdv, {Key? key, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: withdrawPdv.balancesPdvs.isEmpty
          ? const Center(child: Text('Relatorio sem Dados'))
          : ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text(
                  'Retiradas Pdvs',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: withdrawPdv.balancesPdvs.length,
                  itemBuilder: (context, index) {
                    final withdraw = withdrawPdv.balancesPdvs[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          withdraw.pdvName,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Divider(thickness: 1),
                        ItemWithdraw('Vendas', withdraw.cashBalance),
                        ItemWithdraw('Retiradas', withdraw.balanceOfWithdrawals),
                        ItemWithdraw('Saldo', withdraw.currentBalance, bold: true, divider: false),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Geral',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(thickness: 1),
                    ItemWithdraw('Vendas', withdrawPdv.totalBalance),
                    ItemWithdraw('Retiradas', withdrawPdv.totalWithdrawals),
                    ItemWithdraw('Saldo', withdrawPdv.totalCurrent, bold: true, divider: false),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
    );
  }
}
