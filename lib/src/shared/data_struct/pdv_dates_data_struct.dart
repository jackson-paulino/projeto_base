import '../../domain/entities/pdv_dates.dart';
import '../utils/app_format.dart';
import 'pdv_date_item_data_struct.dart';

class PdvDatesDataStruct {
  String creditoQuantityGeral;
  String creditoGeral;
  String debitoQuantityGeral;
  String debitoGeral;
  String dinheiroQuantityGeral;
  String dinheiroGeral;
  String quantityGeral;
  String valueGeral;
  List<PdvDateitemDataStruct> items;

  PdvDatesDataStruct({
    required this.creditoQuantityGeral,
    required this.creditoGeral,
    required this.debitoQuantityGeral,
    required this.debitoGeral,
    required this.dinheiroQuantityGeral,
    required this.dinheiroGeral,
    required this.quantityGeral,
    required this.valueGeral,
    required this.items,
  });

  static PdvDatesDataStruct fromDataStruct(PdvDates data) {
    List<PdvDateitemDataStruct> items = <PdvDateitemDataStruct>[];
    if (data.items != null) {
      for (var v in data.items!) {
        items.add(PdvDateitemDataStruct.fromDataStruct(v));
      }
    }
    return PdvDatesDataStruct(
        creditoQuantityGeral:
            AppFormat.quantity.format(data.creditoQuantityGeral ?? 0),
        creditoGeral: AppFormat.money.format(data.creditoGeral ?? 0),
        debitoQuantityGeral:
            AppFormat.quantity.format(data.debitoQuantityGeral ?? 0),
        debitoGeral: AppFormat.money.format(data.debitoGeral ?? 0),
        dinheiroQuantityGeral:
            AppFormat.quantity.format(data.dinheiroQuantityGeral ?? 0),
        dinheiroGeral: AppFormat.money.format(data.dinheiroGeral ?? 0),
        quantityGeral: AppFormat.quantity.format(data.quantityGeral ?? 0),
        valueGeral: AppFormat.money.format(data.valueGeral ?? 0),
        items: items);
  }
}
