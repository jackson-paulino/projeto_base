import '../../domain/entities/balance_pdv.dart';

class BalancesPdvsAdapter {
  static BalancePdv fromJson(Map<String, dynamic> data) {
    return BalancePdv(
      pdvName: data['pdv_name'],
      balanceOfWithdrawals: data['balance_of_withdrawals'],
      currentBalance: data['current_balance'],
      cashBalance: data['cash_balance'],
    );
  }
}
