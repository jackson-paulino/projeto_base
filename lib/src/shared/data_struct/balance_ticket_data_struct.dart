import '../../domain/entities/balance_tickets.dart';
import '../utils/app_format.dart';
import 'courtesys_data_struct.dart';
import 'tickets_data_struct.dart';

class BalanceTicketDataStruct {
  String grandTotalTicketQuantitySold;
  String grandTotalTicketSold;
  String grandTotalTicketCourtesyQuantity;
  List<TicketsDataStruct> tickets;
  List<CourtesysDataStruct> courtesys;

  BalanceTicketDataStruct._({
    required this.grandTotalTicketQuantitySold,
    required this.grandTotalTicketSold,
    required this.grandTotalTicketCourtesyQuantity,
    required this.tickets,
    required this.courtesys,
  });

  static BalanceTicketDataStruct fromDataStruct(BalanceTickets data) {
    List<TicketsDataStruct> tickets = <TicketsDataStruct>[];
    for (var element in data.tickets!) {
      final item = TicketsDataStruct.fromDataStruct(element);
      tickets.add(item);
    }
    List<CourtesysDataStruct> courtesys = <CourtesysDataStruct>[];
    for (var element in data.courtesys!) {
      final item = CourtesysDataStruct.fromDataStruct(element);
      courtesys.add(item);
    }
    return BalanceTicketDataStruct._(
      grandTotalTicketQuantitySold:
          AppFormat.quantity.format(data.grandTotalTicketQuantitySold ?? 0),
      grandTotalTicketSold: AppFormat.money.format(data.grandTotalTicketSold ?? 0),
      grandTotalTicketCourtesyQuantity:
          AppFormat.quantity.format(data.grandTotalTicketCourtesyQuantity ?? 0),
      tickets: tickets,
      courtesys: courtesys,
    );
  }
}
