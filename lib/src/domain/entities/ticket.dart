import 'lote.dart';

class Ticket {
  String? name;
  String? type;
  bool? useCard;
  List<Lotes>? lotes;
  int? totalQuantity;
  num? total;

  Ticket({
    this.name,
    this.type,
    this.useCard,
    this.lotes,
    this.totalQuantity,
    this.total,
  });
}
