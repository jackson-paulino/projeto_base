import '../../domain/entities/sales_dates.dart';
import '../utils/app_format.dart';
import 'sale_data_struct.dart';

class SalesDatesDataStruct {
  String quantityGeneral;
  String totalGeneral;
  String quantityValidated;
  List<SaleDataStruct> sales;

  SalesDatesDataStruct({
    required this.quantityGeneral,
    required this.totalGeneral,
    required this.quantityValidated,
    required this.sales,
  });

  static SalesDatesDataStruct fromDataStruct(SalesDates data) {
    List<SaleDataStruct> sales = <SaleDataStruct>[];
    for (var element in data.sales!) {
      final item = SaleDataStruct.fromDataStruct(element);
      sales.add(item);
    }
    return SalesDatesDataStruct(
      quantityGeneral: AppFormat.quantity.format(data.quantityGeneral ?? 0),
      totalGeneral: AppFormat.money.format(data.totalGeneral ?? 0),
      quantityValidated: AppFormat.quantity.format(data.quantityValidated ?? 0),
      sales: sales,
    );
  }
}
