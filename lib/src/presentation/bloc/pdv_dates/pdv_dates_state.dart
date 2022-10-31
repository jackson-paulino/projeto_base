import '../../../domain/entities/pdv_dates.dart';
import '../../../domain/errors/errors.dart';

abstract class PdvDatesState {}

class PdvDatesInitialState extends PdvDatesState {}

class PdvDatesLoadingState extends PdvDatesState {}

class PdvDatesFinishedState implements PdvDatesState {
  final PdvDates salesDates;

  PdvDatesFinishedState(this.salesDates);
}

class PdvDatesFailureState implements PdvDatesState {
  final IErrorsException errorException;

  PdvDatesFailureState(this.errorException);
}
