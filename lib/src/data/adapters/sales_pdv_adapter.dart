import '../../domain/entities/balances_pdv.dart';
import '../../domain/entities/sales_pdv.dart';
import 'balance_pdv_adapter.dart';

class SalesPdvAdapter {
  static SalesPdv fromJson(Map<String, dynamic> data) {
    List<BalancesPdvs> balances = <BalancesPdvs>[];
    if (data['balances_pdvs'] != null) {
      data['balances_pdvs'].forEach((v) {
        balances.add(BalancePdvsAdapter.fromJson(v));
      });
    }

    return SalesPdv(
      moneyGeneral: data['money_general'],
      creditCardGeneral: data['credit_card_general'],
      debitCardGeneral: data['debit_card_general'],
      totalGeneral: data['total_general'],
      balancesPdvs: balances,
    );
  }
}
