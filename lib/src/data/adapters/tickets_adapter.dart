import '../../domain/entities/lote.dart';
import '../../domain/entities/ticket.dart';
import 'lotes_adapter.dart';

class TicketsAdapter {
  static Ticket fromJson(Map<String, dynamic> data) {
    List<Lotes> lotes = <Lotes>[];
    if (data['lotes'] != null) {
      data['lotes'].forEach((v) {
        lotes.add(LotesAdapter.fromJson(v));
      });
    }
    return Ticket(
      name: data['name'],
      type: data['type'],
      useCard: data['use_card'],
      lotes: lotes,
      totalQuantity: data['total_quantity'],
      total: data['total'],
    );
  }
}
