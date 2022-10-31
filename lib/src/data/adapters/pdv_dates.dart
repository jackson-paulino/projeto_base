import 'package:projeto_base/src/data/adapters/pdv_date_item_adpater.dart';

import '../../domain/entities/pdv_date_item.dart';
import '../../domain/entities/pdv_dates.dart';

class PdvDatesAdapter {
  static PdvDates fromJson(Map<String, dynamic> data) {
    List<PdvDateItem> items = <PdvDateItem>[];
    if (data['items'] != null) {
      data['items'].forEach((v) {
        items.add(PdvDateItemAdapter.fromJson(v));
      });
    }

    return PdvDates(
      creditoQuantityGeral: data['credito_quantity_geral'],
      creditoGeral: data['credito_geral'],
      debitoQuantityGeral: data['debito_quantity_geral'],
      debitoGeral: data['debito_geral'],
      dinheiroQuantityGeral: data['dinheiro_quantity_geral'],
      dinheiroGeral: data['dinheiro_geral'],
      quantityGeral: data['quantity_geral'],
      valueGeral: data['value_geral'],
      items: items,
    );
  }
}
