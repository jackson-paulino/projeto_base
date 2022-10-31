import '../../domain/entities/ticket.dart';
import '../utils/app_format.dart';
import 'lotes_data_struct.dart';

class TicketsDataStruct {
  String name;
  String type;
  String payment;
  List<LotesDataStruct> lotes;
  String totalQuantity;
  String total;

  TicketsDataStruct._({
    required this.name,
    required this.type,
    required this.payment,
    required this.lotes,
    required this.totalQuantity,
    required this.total,
  });

  static TicketsDataStruct fromDataStruct(Ticket data) {
    var payment = '';
    List<LotesDataStruct> lotes = <LotesDataStruct>[];
    for (var element in data.lotes!) {
      final item = LotesDataStruct.fromDataStruct(element);
      lotes.add(item);
    }

    if (data.useCard != null) {
      payment = data.useCard! ? 'Cartão' : 'Dinheiro';
    }
    return TicketsDataStruct._(
      name: data.name ?? '',
      total: AppFormat.money.format(data.total ?? 0),
      totalQuantity: AppFormat.quantity.format(data.totalQuantity ?? 0),
      type: data.type ?? '',
      payment: payment,
      lotes: lotes,
    );
  }
}
