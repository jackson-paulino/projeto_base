import '../../domain/entities/lote_ticket.dart';
import '../utils/app_format.dart';

class LoteTicketDataStrcut {
  String price;
  String name;

  LoteTicketDataStrcut({
    required this.price,
    required this.name,
  });

  static LoteTicketDataStrcut fromDataStruct(LoteTicket data) {
    return LoteTicketDataStrcut(
        price: AppFormat.money.format(data.price ?? 0), name: data.name ?? '');
  }
}
