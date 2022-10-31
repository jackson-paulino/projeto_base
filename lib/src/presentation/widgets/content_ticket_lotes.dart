import 'package:flutter/material.dart';

import '../../domain/entities/ticket_lotes.dart';
import '../../shared/data_struct/ticket_lotes_data_struct.dart';
import '../../shared/theme/app_colors.dart';

class ContentTicketLotes extends StatelessWidget {
  final List<TicketLotes> ticketLotes;
  final Future<void> Function() onRefresh;
  const ContentTicketLotes(this.ticketLotes,
      {Key? key, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ticketLotes.isEmpty
          ? const Center(child: Text('Relatorio sem Dados'))
          : ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text(
                  'Lotes a Venda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ticketLotes.length,
                  itemBuilder: (context, index) {
                    final ticket = TicketLotesDataStruct.fromDataStruct(
                        ticketLotes[index]);
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ticket.name),
                                  Text(
                                    ticket.type,
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.typeTicket,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                                child: Text(ticket.payment,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800))),
                          ],
                        ),
                        const Divider(thickness: 1),
                        Row(
                          children: [
                            Expanded(child: Text('Lote: ${ticket.lote.name}')),
                            Expanded(
                                child: Text(
                              'Valor: ${ticket.lote.price}',
                              textAlign: TextAlign.right,
                            ))
                          ],
                        ),
                        const Divider(thickness: 1),
                        const SizedBox(height: 15)
                      ],
                    );
                  },
                )
              ],
            ),
    );
  }
}
