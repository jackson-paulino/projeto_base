import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_sales_pdv_usecase.dart';
import 'sales_pdv_event.dart';
import 'sales_pdv_state.dart';

class SalesPdvBloc extends Bloc<SalesPdvEvent, SalesPdvState> {
  final IFeatchSalesPdvUsecase featchSalesPdv;

  SalesPdvBloc(this.featchSalesPdv) : super(SalesPdvInitialState()) {
    on<FeatchSalesPdvEvent>(_onFeatchSalesPdv);
  }

  void _onFeatchSalesPdv(
    FeatchSalesPdvEvent event,
    Emitter<SalesPdvState> emitter,
  ) async {
    emitter(SalesPdvLoadingState());

    final result = await featchSalesPdv(event.eventId);

    result.fold(
      (l) => emitter(SalesPdvFailureState(l)),
      (r) => emitter(SalesPdvFinishedState(r)),
    );
  }
}
