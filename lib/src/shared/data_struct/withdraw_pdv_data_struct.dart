import '../../domain/entities/withdraw_pdv.dart';
import '../utils/app_format.dart';
import 'balance_pdvs_data_struct.dart';

class WithdrawPdvDataStruct {
  String totalCurrent;
  String totalBalance;
  String totalWithdrawals;
  List<BalancePdvsDataStruct> balancesPdvs;

  WithdrawPdvDataStruct({
    required this.totalCurrent,
    required this.totalBalance,
    required this.totalWithdrawals,
    required this.balancesPdvs,
  });

  static WithdrawPdvDataStruct fromDataStruct(WithdrawPdv data) {
    List<BalancePdvsDataStruct> balancesPdvs = <BalancePdvsDataStruct>[];
    for (var element in data.balancesPdvs!) {
      final item = BalancePdvsDataStruct.fromDataStruct(element);
      balancesPdvs.add(item);
    }
    return WithdrawPdvDataStruct(
        totalCurrent: AppFormat.money.format(data.totalCurrent ?? 0),
        totalBalance: AppFormat.money.format(data.totalBalance ?? 0),
        totalWithdrawals: AppFormat.money.format(data.totalWithdrawals ?? 0),
        balancesPdvs: balancesPdvs);
  }
}
