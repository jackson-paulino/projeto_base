import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_ticket_lotes_usecase.dart';
import 'ticket_lotes_event.dart';
import 'ticket_lotes_state.dart';

class TicketLotesBloc extends Bloc<TicketLotesEvent, TicketLotesState> {
  final IFeatchTicketLotesUsecase featchTicketLotes;

  TicketLotesBloc(this.featchTicketLotes) : super(TicketLotesInitialState()) {
    on<FeatchTicketLotesEvent>(_onFeatchSalesPdv);
  }

  void _onFeatchSalesPdv(
    FeatchTicketLotesEvent event,
    Emitter<TicketLotesState> emitter,
  ) async {
    emitter(TicketLotesLoadingState());

    final result = await featchTicketLotes(event.eventId);

    result.fold(
      (l) => emitter(TicketLotesFailureState(l)),
      (r) => emitter(TicketLotesFinishedState(r)),
    );
  }
}
