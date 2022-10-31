import '../../domain/entities/lote_ticket.dart';

class LoteTicketAdapter {
  static LoteTicket fromJson(Map<String, dynamic> data) {
    return LoteTicket(
      price: data['price'],
      name: data['name'],
    );
  }
}
