import '../../domain/entities/sales_pdv.dart';
import '../utils/app_format.dart';
import 'balance_pdv_data_struct.dart';

class SalesPdvDataStruct {
  String moneyGeneral;
  String creditCardGeneral;
  String debitCardGeneral;
  String totalGeneral;
  List<BalancesPdvsDataStruct> balancesPdvs;

  SalesPdvDataStruct._(
      {required this.moneyGeneral,
      required this.creditCardGeneral,
      required this.debitCardGeneral,
      required this.totalGeneral,
      required this.balancesPdvs});

  static SalesPdvDataStruct fromDataStruct(SalesPdv data) {
    List<BalancesPdvsDataStruct> balancePdv = <BalancesPdvsDataStruct>[];
    for (var element in data.balancesPdvs!) {
      final item = BalancesPdvsDataStruct.fromDataStruct(element);
      balancePdv.add(item);
    }
    return SalesPdvDataStruct._(
      moneyGeneral: AppFormat.money.format(data.moneyGeneral ?? 0),
      creditCardGeneral: AppFormat.money.format(data.creditCardGeneral ?? 0),
      debitCardGeneral: AppFormat.money.format(data.debitCardGeneral ?? 0),
      totalGeneral: AppFormat.money.format(data.totalGeneral ?? 0),
      balancesPdvs: balancePdv,
    );
  }
}
