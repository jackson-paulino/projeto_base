import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_pdvs_usecase.dart';
import 'pdvs_event.dart';
import 'pdvs_state.dart';

class PdvsBloc extends Bloc<PdvsEvent, PdvsState> {
  final IFeatchPdvsUsecase featchPdvs;

  PdvsBloc(this.featchPdvs) : super(PdvsInitialState()) {
    on<FeatchPdvsEvent>(_onFeatchSalesPdv);
  }

  void _onFeatchSalesPdv(
    FeatchPdvsEvent event,
    Emitter<PdvsState> emitter,
  ) async {
    emitter(PdvsLoadingState());

    final result = await featchPdvs(event.eventId);

    result.fold(
      (l) => emitter(PdvsFailureState(l)),
      (r) => emitter(PdvsFinishedState(r, event.eventId)),
    );
  }
}
