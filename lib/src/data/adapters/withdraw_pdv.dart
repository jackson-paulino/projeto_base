import '../../domain/entities/balance_pdv.dart';
import '../../domain/entities/withdraw_pdv.dart';
import 'balances_pdv_adapter.dart';

class WithdrawPdvAdapter {
  static WithdrawPdv fromJson(Map<String, dynamic> data) {
    List<BalancePdv> balancesPdvs = <BalancePdv>[];
    if (data['balances_pdvs'] != null) {
      data['balances_pdvs'].forEach((v) {
        balancesPdvs.add(BalancesPdvsAdapter.fromJson(v));
      });
    }
    return WithdrawPdv(
      totalCurrent: data['total_current'],
      totalBalance: data['total_balance'],
      totalWithdrawals: data['total_withdrawals'],
      balancesPdvs: balancesPdvs,
    );
  }
}
