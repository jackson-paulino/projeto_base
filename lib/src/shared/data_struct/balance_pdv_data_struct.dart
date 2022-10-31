import '../../domain/entities/balances_pdv.dart';
import '../utils/app_format.dart';

class BalancesPdvsDataStruct {
  String pdvName;
  String money;
  String creditCard;
  String debitCard;
  String total;

  BalancesPdvsDataStruct._({
    required this.pdvName,
    required this.money,
    required this.creditCard,
    required this.debitCard,
    required this.total,
  });

  static BalancesPdvsDataStruct fromDataStruct(BalancesPdvs data) {
    return BalancesPdvsDataStruct._(
      pdvName: data.pdvName ?? '',
      money: AppFormat.money.format(data.money ?? 0),
      creditCard: AppFormat.money.format(data.creditCard ?? 0),
      debitCard: AppFormat.money.format(data.debitCard ?? 0),
      total: AppFormat.money.format(data.total ?? 0),
    );
  }
}
