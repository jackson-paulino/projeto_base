import 'pdv_date_item.dart';

class PdvDates {
  num? creditoQuantityGeral;
  num? creditoGeral;
  num? debitoQuantityGeral;
  num? debitoGeral;
  num? dinheiroQuantityGeral;
  num? dinheiroGeral;
  num? quantityGeral;
  num? valueGeral;
  List<PdvDateItem>? items;

  PdvDates(
      {this.creditoQuantityGeral,
      this.creditoGeral,
      this.debitoQuantityGeral,
      this.debitoGeral,
      this.dinheiroQuantityGeral,
      this.dinheiroGeral,
      this.quantityGeral,
      this.valueGeral,
      this.items});
}
