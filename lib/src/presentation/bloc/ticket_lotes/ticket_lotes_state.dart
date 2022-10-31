import '../../../domain/entities/ticket_lotes.dart';
import '../../../domain/errors/errors.dart';

abstract class TicketLotesState {}

class TicketLotesInitialState extends TicketLotesState {}

class TicketLotesLoadingState extends TicketLotesState {}

class TicketLotesFinishedState implements TicketLotesState {
  final List<TicketLotes> ticketLotes;

  TicketLotesFinishedState(this.ticketLotes);
}

class TicketLotesFailureState implements TicketLotesState {
  final IErrorsException errorException;

  TicketLotesFailureState(this.errorException);
}
