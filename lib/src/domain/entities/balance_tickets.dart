import 'courtesy.dart';
import 'ticket.dart';

class BalanceTickets {
  int? grandTotalTicketQuantitySold;
  num? grandTotalTicketSold;
  int? grandTotalTicketCourtesyQuantity;
  List<Ticket>? tickets;
  List<Courtesy>? courtesys;

  BalanceTickets({
    this.grandTotalTicketQuantitySold,
    this.grandTotalTicketSold,
    this.grandTotalTicketCourtesyQuantity,
    this.tickets,
    this.courtesys,
  });
}
