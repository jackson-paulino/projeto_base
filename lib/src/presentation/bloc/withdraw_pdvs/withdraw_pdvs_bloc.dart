import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_withdraw_pdv_usecase.dart';
import 'withdraw_pdvs_event.dart';
import 'withdraw_pdvs_state.dart';

class WithdrawPdvsBloc extends Bloc<WithdrawPdvsEvent, WithdrawPdvsState> {
  final IFeatchWithdrawPdvUsecase featchWithdrawPdv;

  WithdrawPdvsBloc(this.featchWithdrawPdv) : super(WithdrawPdvsInitialState()) {
    on<FeatchWithdrawPdvsEvent>(_onFeatchSalesPdv);
  }

  void _onFeatchSalesPdv(
    FeatchWithdrawPdvsEvent event,
    Emitter<WithdrawPdvsState> emitter,
  ) async {
    emitter(SalesPdvLoadingState());

    final result = await featchWithdrawPdv(event.eventId);

    result.fold(
      (l) => emitter(WithdrawPdvsFailureState(l)),
      (r) => emitter(WithdrawPdvsFinishedState(r)),
    );
  }
}
