import '../../domain/entities/sale.dart';
import '../utils/app_format.dart';

class SaleDataStruct {
  String selledDate;
  String quantity;
  String total;

  SaleDataStruct({
    required this.selledDate,
    required this.quantity,
    required this.total,
  });

  static SaleDataStruct fromDataStruct(Sale data) {
    return SaleDataStruct(
      selledDate: data.selledDate != null
          ? AppFormat.date.format(DateTime.parse(data.selledDate!))
          : 'Sem Data',
      quantity: AppFormat.quantity.format(data.quantity ?? 0),
      total: AppFormat.money.format(data.total ?? 0),
    );
  }
}
