import '../../domain/entities/balances_pdv.dart';

class BalancePdvsAdapter {
  static BalancesPdvs fromJson(Map<String, dynamic> data) {
    return BalancesPdvs(
      pdvName: data['pdv_name'],
      money: data['money'],
      creditCard: data['credit_card'],
      debitCard: data['debit_card'],
      total: data['total'],
    );
  }
}
