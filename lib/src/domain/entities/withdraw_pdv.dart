import 'balance_pdv.dart';

class WithdrawPdv {
  num? totalCurrent;
  num? totalBalance;
  num? totalWithdrawals;
  List<BalancePdv>? balancesPdvs;

  WithdrawPdv({
    this.totalCurrent,
    this.totalBalance,
    this.totalWithdrawals,
    this.balancesPdvs,
  });
}
