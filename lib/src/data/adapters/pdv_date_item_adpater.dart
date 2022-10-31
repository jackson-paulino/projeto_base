import '../../domain/entities/pdv_date_item.dart';

class PdvDateItemAdapter {
  static PdvDateItem fromJson(Map<String, dynamic> data) {
    return PdvDateItem(
      selledDate: data['selled_date'],
      credito: data['credito'],
      creditoQuantity: data['credito_quantity'],
      debito: data['debito'],
      debitoQuantity: data['debito_quantity'],
      dinheiro: data['dinheiro'],
      dinheiroQuantity: data['dinheiro_quantity'],
      quantity: data['quantity'],
      total: data['total'],
      ticketType: data['ticket_type'],
    );
  }
}
