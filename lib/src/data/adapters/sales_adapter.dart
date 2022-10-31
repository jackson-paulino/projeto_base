import '../../domain/entities/sale.dart';

class SalesAdapter {
  static Sale fromJson(Map<String, dynamic> data) {
    return Sale(
      selledDate: data['selled_date'],
      quantity: data['quantity'],
      total: data['total'],
    );
  }
}
