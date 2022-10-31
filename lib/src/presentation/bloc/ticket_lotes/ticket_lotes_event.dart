abstract class TicketLotesEvent {}

class FeatchTicketLotesEvent implements TicketLotesEvent {
  final String eventId;

  FeatchTicketLotesEvent(this.eventId);
}
