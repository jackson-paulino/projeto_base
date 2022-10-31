import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_events_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IFeatchEventsUsecase featchEvents;

  HomeBloc(this.featchEvents) : super(HomeInitialState()) {
    on<FeatchEventsEvent>(_onFeatchEvents);
    on<InitializeHomeEvent>(_cleanEvents);
  }

  void _onFeatchEvents(
    FeatchEventsEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeLoadingState());

    final result = await featchEvents(eventWon: event.eventWon);

    result.fold(
      (l) => emitter(HomeFailureState(l)),
      (r) => emitter(HomeFeatchFinishedState(r)),
    );
  }

  void _cleanEvents(
    InitializeHomeEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeInitialState());
  }
}
