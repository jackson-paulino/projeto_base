import '../../domain/entities/lote.dart';
import '../utils/app_format.dart';

class LotesDataStruct {
  String price;
  String name;
  String quantity;
  String total;

  LotesDataStruct._({
    required this.price,
    required this.name,
    required this.quantity,
    required this.total,
  });

  static LotesDataStruct fromDataStruct(Lotes data) {
    return LotesDataStruct._(
      name: data.name ?? '',
      price: AppFormat.money.format(data.price ?? 0),
      quantity: AppFormat.quantity.format(data.quantity ?? 0),
      total: AppFormat.money.format(data.total ?? 0),
    );
  }
}
