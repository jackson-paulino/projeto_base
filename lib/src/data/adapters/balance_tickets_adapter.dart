import '../../domain/entities/balance_tickets.dart';
import '../../domain/entities/courtesy.dart';
import '../../domain/entities/ticket.dart';
import 'courtesys_adpater.dart';
import 'tickets_adapter.dart';

class BalanceTicketsAdapter {
  static BalanceTickets fromJson(Map<String, dynamic> data) {
    List<Ticket>? tickets = <Ticket>[];
    List<Courtesy>? courtesys = <Courtesy>[];
    if (data['tickets'] != null) {
      data['tickets'].forEach((v) {
        tickets.add(TicketsAdapter.fromJson(v));
      });
    }
    if (data['courtesys'] != null) {
      courtesys = <Courtesy>[];
      data['courtesys'].forEach((v) {
        courtesys!.add(CourtesysAdapter.fromJson(v));
      });
    }
    return BalanceTickets(
      grandTotalTicketQuantitySold: data['grand_total_ticket_quantity_sold'],
      grandTotalTicketSold: data['grand_total_ticket_sold'],
      grandTotalTicketCourtesyQuantity: data['grand_total_ticket_courtesy_quantity'],
      tickets: tickets,
      courtesys: courtesys,
    );
  }
}
