import '../../domain/entities/sale.dart';
import '../../domain/entities/sales_dates.dart';
import 'sales_adapter.dart';

class SalesDatesAdapter {
  static SalesDates fromJson(Map<String, dynamic> data) {
    List<Sale> sales = <Sale>[];
    if (data['sales'] != null) {
      data['sales'].forEach((v) {
        sales.add(SalesAdapter.fromJson(v));
      });
    }
    return SalesDates(
      quantityGeneral: data['quantity_general'],
      totalGeneral: data['total_general'],
      quantityValidated: data['quantity_validated'],
      sales: sales,
    );
  }
}
