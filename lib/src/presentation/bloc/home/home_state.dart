import '../../../domain/entities/event.dart';
import '../../../domain/errors/errors.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeFeatchFinishedState implements HomeState {
  final List<Event> events;

  HomeFeatchFinishedState(this.events);
}

class HomeFailureState implements HomeState {
  final IErrorsException errorException;

  HomeFailureState(this.errorException);
}
