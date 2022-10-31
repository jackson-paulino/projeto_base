import '../../domain/entities/pdv_date_item.dart';
import '../utils/app_format.dart';

class PdvDateitemDataStruct {
  String selledDate;
  String credito;
  String creditoQuantity;
  String debito;
  String debitoQuantity;
  String dinheiro;
  String dinheiroQuantity;
  String quantity;
  String total;
  String ticketType;

  PdvDateitemDataStruct({
    required this.selledDate,
    required this.credito,
    required this.creditoQuantity,
    required this.debito,
    required this.debitoQuantity,
    required this.dinheiro,
    required this.dinheiroQuantity,
    required this.quantity,
    required this.total,
    required this.ticketType,
  });

  static PdvDateitemDataStruct fromDataStruct(PdvDateItem data) {
    return PdvDateitemDataStruct(
        selledDate: data.selledDate != null
            ? AppFormat.date.format(DateTime.parse(data.selledDate!))
            : 'Sem Data',
        credito: AppFormat.money.format(data.credito ?? 0),
        creditoQuantity: AppFormat.quantity.format(data.creditoQuantity ?? 0),
        debito: AppFormat.money.format(data.debito ?? 0),
        debitoQuantity: AppFormat.quantity.format(data.debitoQuantity ?? 0),
        dinheiro: AppFormat.money.format(data.dinheiro ?? 0),
        dinheiroQuantity: AppFormat.quantity.format(data.dinheiroQuantity ?? 0),
        quantity: AppFormat.quantity.format(data.quantity ?? 0),
        total: AppFormat.money.format(data.total ?? 0),
        ticketType: data.ticketType ?? '');
  }
}
