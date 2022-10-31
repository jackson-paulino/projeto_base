import '../../../domain/entities/withdraw_pdv.dart';
import '../../../domain/errors/errors.dart';

abstract class WithdrawPdvsState {}

class WithdrawPdvsInitialState extends WithdrawPdvsState {}

class SalesPdvLoadingState extends WithdrawPdvsState {}

class WithdrawPdvsFinishedState implements WithdrawPdvsState {
  final WithdrawPdv withdrawPdv;

  WithdrawPdvsFinishedState(this.withdrawPdv);
}

class WithdrawPdvsFailureState implements WithdrawPdvsState {
  final IErrorsException errorException;

  WithdrawPdvsFailureState(this.errorException);
}
