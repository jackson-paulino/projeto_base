import 'package:flutter/material.dart';

import '../../shared/data_struct/balance_ticket_data_struct.dart';
import 'header_ticket.dart';
import 'item_lotes.dart';
import 'totally_ticket.dart';

class ContentTicketSales extends StatelessWidget {
  final BalanceTicketDataStruct balance;
  final Future<void> Function() onRefresh;
  const ContentTicketSales(this.balance, {Key? key, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Text(
            'Vendas Por Ingressos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 15),
          if (balance.tickets.isNotEmpty) ...[
            const Text('Pagantes',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 15),
          ],
          balance.tickets.isEmpty
              ? const Center(child: Text('Relatorio sem Dados'))
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: balance.tickets.length,
                  itemBuilder: (context, index) {
                    var swing = balance.tickets[index];
                    return Column(
                      children: [
                        HeaderTicket(swing: swing),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: swing.lotes.length,
                          itemBuilder: (context, index) {
                            final lote = swing.lotes[index];
                            return ItemLote(lote);
                          },
                        ),
                        TotallyTicket(
                            bold: true,
                            'Total',
                            swing.totalQuantity,
                            swing.total)
                      ],
                    );
                  },
                ),
          const SizedBox(height: 10),
          if (balance.tickets.isNotEmpty) ...[
            TotallyTicket(
              bold: true,
              'Total Geral',
              balance.grandTotalTicketQuantitySold,
              balance.grandTotalTicketSold,
            ),
            const SizedBox(height: 30),
          ],
          if (balance.courtesys.isNotEmpty) ...[
            const Text('Cortesias',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 15),
          ],
          if (balance.courtesys.isNotEmpty) ...[
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: balance.courtesys.length,
              itemBuilder: (context, index) {
                var courtesys = balance.courtesys[index];
                return Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(courtesys.name)),
                    const Divider(thickness: 1),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: courtesys.lotes.length,
                      itemBuilder: (context, index) {
                        var lote = courtesys.lotes[index];
                        return TotallyTicket(lote.name, lote.quantity, '');
                      },
                    )
                  ],
                );
              },
            )
          ],
          if (balance.courtesys.isNotEmpty) ...[
            const SizedBox(height: 10),
            TotallyTicket(
                bold: true,
                'Total Geral',
                balance.grandTotalTicketCourtesyQuantity,
                '')
          ],
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
