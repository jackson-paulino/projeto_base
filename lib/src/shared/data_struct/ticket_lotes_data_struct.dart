import '../../domain/entities/lote_ticket.dart';
import '../../domain/entities/ticket_lotes.dart';
import 'lote_ticket_data_struct.dart';

class TicketLotesDataStruct {
  String name;
  String type;
  String payment;
  LoteTicketDataStrcut lote;

  TicketLotesDataStruct({
    required this.name,
    required this.type,
    required this.payment,
    required this.lote,
  });

  static TicketLotesDataStruct fromDataStruct(TicketLotes data) {
    var payment = '';
    if (data.useCard != null) {
      payment = data.useCard! ? 'Cartão' : 'Dinheiro';
    }
    return TicketLotesDataStruct(
      name: data.name ?? '',
      type: data.type ?? '',
      payment: payment,
      lote: LoteTicketDataStrcut.fromDataStruct(data.lote ?? LoteTicket()),
    );
  }
}
