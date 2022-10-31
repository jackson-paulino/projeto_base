import '../../domain/entities/balance_pdv.dart';
import '../utils/app_format.dart';

class BalancePdvsDataStruct {
  String pdvName;
  String balanceOfWithdrawals;
  String currentBalance;
  String cashBalance;

  BalancePdvsDataStruct({
    required this.pdvName,
    required this.balanceOfWithdrawals,
    required this.currentBalance,
    required this.cashBalance,
  });

  static BalancePdvsDataStruct fromDataStruct(BalancePdv data) {
    return BalancePdvsDataStruct(
      pdvName: data.pdvName ?? '',
      balanceOfWithdrawals: AppFormat.money.format(data.balanceOfWithdrawals ?? 0),
      currentBalance: AppFormat.money.format(data.currentBalance ?? 0),
      cashBalance: AppFormat.money.format(data.cashBalance ?? 0),
    );
  }
}
