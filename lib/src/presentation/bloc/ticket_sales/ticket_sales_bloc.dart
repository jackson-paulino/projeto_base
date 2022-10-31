import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_ticket_sales_usecase.dart';
import 'ticket_sales_event.dart';
import 'ticket_sales_state.dart';

class TicketSalesBloc extends Bloc<TicketSalesEvent, TicketSalesState> {
  final IFeatchTicketSalesUsecase featchTecketSales;

  TicketSalesBloc(this.featchTecketSales) : super(TicketSalesInitialState()) {
    on<FeatchTicketSalesEvent>(_onFeatchTicketSales);
  }

  void _onFeatchTicketSales(
    FeatchTicketSalesEvent event,
    Emitter<TicketSalesState> emitter,
  ) async {
    emitter(TicketSalesLoadingState());

    final result = await featchTecketSales(event.eventId);

    result.fold(
      (l) => emitter(TicketSalesFailureState(l)),
      (r) => emitter(TicketSalesFinishedState(r)),
    );
  }
}
