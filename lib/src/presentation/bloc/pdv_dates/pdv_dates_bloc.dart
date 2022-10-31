import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/featch_pdv_dates_usecase.dart';
import 'pdv_dates_event.dart';
import 'pdv_dates_state.dart';

class PdvDatesBloc extends Bloc<PdvDatesEvent, PdvDatesState> {
  final IFeatchPdvDatesUsecase featchPdvDates;

  PdvDatesBloc(this.featchPdvDates) : super(PdvDatesInitialState()) {
    on<FeatchPdvDatesEvent>(_onFeatchPdvDates);
  }

  void _onFeatchPdvDates(
    FeatchPdvDatesEvent event,
    Emitter<PdvDatesState> emitter,
  ) async {
    emitter(PdvDatesLoadingState());

    final result = await featchPdvDates(event.eventId, event.pdvId);

    result.fold(
      (l) => emitter(PdvDatesFailureState(l)),
      (r) => emitter(PdvDatesFinishedState(r)),
    );
  }
}
