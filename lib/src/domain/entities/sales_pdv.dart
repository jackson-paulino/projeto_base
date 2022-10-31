import 'balances_pdv.dart';

class SalesPdv {
  num? moneyGeneral;
  num? creditCardGeneral;
  num? debitCardGeneral;
  num? totalGeneral;
  List<BalancesPdvs>? balancesPdvs;

  SalesPdv(
      {this.moneyGeneral,
      this.creditCardGeneral,
      this.debitCardGeneral,
      this.totalGeneral,
      this.balancesPdvs});
}
