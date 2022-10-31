import '../../domain/entities/lote.dart';

class LotesAdapter {
  static Lotes fromJson(Map<String, dynamic> data) {
    return Lotes(
      price: data['price'],
      name: data['name'],
      quantity: data['quantity'],
      total: data['total'],
    );
  }
}
