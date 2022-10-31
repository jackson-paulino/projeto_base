import '../../../domain/entities/balance_tickets.dart';
import '../../../domain/errors/errors.dart';

abstract class TicketSalesState {}

class TicketSalesInitialState extends TicketSalesState {}

class TicketSalesLoadingState extends TicketSalesState {}

class TicketSalesFinishedState implements TicketSalesState {
  final BalanceTickets balance;

  TicketSalesFinishedState(this.balance);
}

class TicketSalesFailureState implements TicketSalesState {
  final IErrorsException errorException;

  TicketSalesFailureState(this.errorException);
}
