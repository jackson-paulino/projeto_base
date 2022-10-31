import '../../domain/entities/ticket_lotes.dart';
import 'lote_ticket_adpater.dart';

class TicketLotesAdapter {
  static TicketLotes fromJson(Map<String, dynamic> data) {
    return TicketLotes(
      name: data['name'],
      type: data['type'],
      useCard: data['use_card'],
      lote: data['lote'] != null ? LoteTicketAdapter.fromJson(data['lote']) : null,
    );
  }
}
