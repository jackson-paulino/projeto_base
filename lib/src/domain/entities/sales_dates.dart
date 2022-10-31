import 'sale.dart';

class SalesDates {
  int? quantityGeneral;
  num? totalGeneral;
  int? quantityValidated;
  List<Sale>? sales;

  SalesDates({
    this.quantityGeneral,
    this.totalGeneral,
    this.sales,
    this.quantityValidated,
  });
}
