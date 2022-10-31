import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/featch_sales_dates_usecase.dart';
import 'sales_dates_event.dart';
import 'sales_dates_state.dart';

class SalesDatesBloc extends Bloc<SalesDatesEvent, SalesDatesState> {
  final IFeatchSalesDatesUsecase featchSalesDates;

  SalesDatesBloc(this.featchSalesDates) : super(SalesDatesInitialState()) {
    on<FeatchSalesDatesEvent>(_onFeatchSalesDates);
  }

  void _onFeatchSalesDates(
    FeatchSalesDatesEvent event,
    Emitter<SalesDatesState> emitter,
  ) async {
    emitter(SalesDatesLoadingState());

    final result = await featchSalesDates(event.eventId);

    result.fold(
      (l) => emitter(SalesDatesFailureState(l)),
      (r) => emitter(SalesDatesFinishedState(r)),
    );
  }
}
